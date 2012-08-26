﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using BaoHien.UI.Base;
using DAL;
using BaoHien.Services.Orders;
using BaoHien.Services.Customers;
using BaoHien.Common;
using BaoHien.Services.Products;
using DAL.Helper;
using BaoHien.Services.OrderDetails;
using BaoHien.Services.BaseAttributes;
using BaoHien.Services.ProductAttributes;
using BaoHien.Model;
using System.Drawing.Imaging;
using System.Drawing.Printing;
using System.IO;
using CoolPrintPreview;
using System.Reflection;
using Word = Microsoft.Office.Interop.Word;
namespace BaoHien.UI
{
    public partial class AddOrder : BaseForm
    {
        bool isUpdating = false;
        Order order;
        BindingList<Customer> customers;
        BindingList<OrderDetail> orderDetails;
        BindingList<Product> products;
        BindingList<BaseAttribute> baseAttributesAtRow;

        private System.IO.Stream streamToPrint;
        Image MyImage;
        string streamType;
        [System.Runtime.InteropServices.DllImportAttribute("gdi32.dll")]
        private static extern bool BitBlt

        (

            IntPtr hdcDest, // handle to destination DC

            int nXDest, // x-coord of destination upper-left corner

            int nYDest, // y-coord of destination upper-left corner

            int nWidth, // width of destination rectangle

            int nHeight, // height of destination rectangle

            IntPtr hdcSrc, // handle to source DC

            int nXSrc, // x-coordinate of source upper-left corner

            int nYSrc, // y-coordinate of source upper-left corner

            System.Int32 dwRop // raster operation code

        );
        public AddOrder()
        {
            InitializeComponent();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (validator1.Validate())
            {
                double discount = 0;
                Double.TryParse(txtDiscount.Text, out discount);
                DateTime createdDate = DateTime.Now;
                if (!DateTime.TryParse(txtCreatedDate.Text, out createdDate))
                {
                    createdDate = DateTime.Now;
                };

                double vat = 0;
                Double.TryParse(txtVAT.Text, out vat);
                int userId = 0;
                if (Global.CurrentUser != null)
                {
                    userId = Global.CurrentUser.Id;
                }
                else
                {
                    MessageBox.Show("Hiện tại hệ thống đang có lỗi. Vui lòng thử lại sau!");
                    return;
                }
                if (order != null)//update
                {
                    order.CustId = (int)cbxCustomer.SelectedValue;
                    order.Discount = discount;
                    order.Note = txtNote.Text;
                    order.VAT = vat;
                    order.OrderCode = txtOrderCode.Text;
                    OrderService orderService = new OrderService();
                    bool result = orderService.UpdateOrder(order);
                    if (!result)
                    {
                        MessageBox.Show("Hiện tại hệ thống đang có lỗi. Vui lòng thử lại sau!");
                        return;
                    }
                    else
                    {
                        OrderDetailService orderDetailService = new OrderDetailService();
                        foreach (OrderDetail od in orderDetails)
                        {
                            if (od.ProductId > 0 && od.AttributeId > 0)
                            {
                                if (od.Id == 0)
                                {
                                    od.OrderId = order.Id;
                                    result = orderDetailService.AddOrderDetail(od);
                                }
                                else
                                {
                                    result = orderDetailService.UpdateOrderDetail(od);
                                }

                                if (!result)
                                    break;
                            }


                        }
                        if (!result)
                        {
                            MessageBox.Show("Hiện tại hệ thống đang có lỗi. Vui lòng thử lại sau!");
                            return;
                        }
                        else
                        {
                            MessageBox.Show("Sản phẩm đã được cập nhật thành công");
                        }
                        if (this.CallFromUserControll != null && this.CallFromUserControll is OrderList)
                        {
                            ((OrderList)this.CallFromUserControll).loadOrderList();
                        }

                        this.Close();
                    }
                }
                else//add new
                {
                    if (cbxCustomer.SelectedValue == null)
                    {
                        MessageBox.Show("Bạn cần có một khách hành cho phiếu này!");
                        return;
                    }
                    order = new Order
                    {
                        CustId = cbxCustomer.SelectedValue != null ? (int)cbxCustomer.SelectedValue : 0,
                        Discount = discount,
                        Note = txtNote.Text,
                        VAT = vat,
                        OrderCode = txtOrderCode.Text,
                        CreatedDate = createdDate,
                        CreateBy = userId


                    };
                    OrderService orderService = new OrderService();
                    bool result = orderService.AddOrder(order);
                    long newOrderId = BaoHienRepository.GetMaxId<Order>();
                    OrderDetailService orderDetailService = new OrderDetailService();
                    foreach (OrderDetail od in orderDetails)
                    {
                        if (od.ProductId > 0)
                        {
                            od.OrderId = (int)newOrderId;
                            bool ret = orderDetailService.AddOrderDetail(od);
                            if (!ret)
                            {
                                MessageBox.Show("Hiện tại hệ thống đang có lỗi. Vui lòng thử lại sau!");
                                return;
                            }
                        }
                    }

                    //    foreach (DataGridViewRow dgv in rows)
                    //{

                    //    ProductTypeService productTypeService = new ProductTypeService();
                    //    int id = ObjectHelper.GetValueFromAnonymousType<int>(dgv.DataBoundItem, "Id");
                    //    ProductService productService = new ProductService();
                    //    List<Product> productList = productService.SelectProductByWhere(pt => pt.ProductType == id);
                    //    bool deleteAllProductForThisType = true;
                    //    foreach (Product p in productList)
                    //    {
                    //        if (!productService.DeleteProduct(p.Id))
                    //        {
                    //            deleteAllProductForThisType = false;
                    //            MessageBox.Show("Hiện tại hệ thống đang có lỗi. Vui lòng thử lại sau!");
                    //            break;
                    //        }
                    //    }
                    //    if (!deleteAllProductForThisType || !productTypeService.DeleteProductType(id))
                    //    {
                    //        MessageBox.Show("Hiện tại hệ thống đang có lỗi. Vui lòng thử lại sau!");
                    //        break;
                    //    }

                    //}
                    if (result)
                    {
                        MessageBox.Show("Sản phẩm đã được tạo thành công");
                        //((OrderList)this.CallFromUserControll).loadOrderList();
                        this.Close();
                    }
                    else
                    {
                        MessageBox.Show("Hiện tại hệ thống đang có lỗi. Vui lòng thử lại sau!");
                    }
                }
            }
            
        }
        private void loadSomeData()
        {
            if(customers == null)
            {
                CustomerService customerService = new CustomerService();
                customers = new BindingList<Customer>(customerService.GetCustomers());
            }
            if (customers != null)
            {


                cbxCustomer.DataSource = customers;

                cbxCustomer.DisplayMember = "CustomerName";
                cbxCustomer.ValueMember = "Id";
                if (customers.Count == 0)
                {
                    cbxCustomer.Enabled = false;
                }
            }
            
            ProductService productService = new ProductService();
            products = new BindingList<Product>(productService.GetProducts());
            BaseAttributeService baseAttributeService = new BaseAttributeService();
            baseAttributesAtRow = new BindingList<BaseAttribute>(baseAttributeService.GetBaseAttributes());
            if (order != null)
            {
                if (customers != null)
                {
                    cbxCustomer.SelectedIndex = customers.ToList().FindIndex(cus => cus.Id == order.CustId);
                }
                txtDiscount.Text = order.Discount.HasValue ? order.Discount.Value.ToString() : "";
                txtNote.Text = order.Note;
                txtVAT.Text = order.VAT.HasValue ? order.VAT.Value.ToString() : "";
                txtOrderCode.Text = order.OrderCode;
                txtCreatedDate.Text = order.CreatedDate.ToShortDateString();

            }
            else
            {
                txtOrderCode.Text = RandomGeneration.GeneratingCode(BHConstant.PREFIX_FOR_ORDER);
            }
        }
        public void updateProductionRequestDetailCells()
        {
            if (isUpdating && order != null && orderDetails.Count < dgwOrderDetails.RowCount)
            {

                for (int i = 0; i < orderDetails.Count; i++)
                {
                    for (int j = 0; j < 2 && j < dgwOrderDetails.ColumnCount; j++)
                    {
                        if (dgwOrderDetails.Rows[i].Cells[j] is DataGridViewComboBoxCell)
                        {
                            if (j == 0)
                            {
                                DataGridViewComboBoxCell pkgBoxCell = (DataGridViewComboBoxCell)dgwOrderDetails.Rows[i].Cells[j];
                                pkgBoxCell.Value = orderDetails[i].ProductId;
                            }
                            if (j == 1)
                            {
                                DataGridViewComboBoxCell pkgBoxCell = (DataGridViewComboBoxCell)dgwOrderDetails.Rows[i].Cells[j];
                                pkgBoxCell.Value = orderDetails[i].AttributeId;
                            }
                        }
                    }
                }



            }
            
        }
        public void loadDataForEditOrder(int orderId)
        {
            isUpdating = true;
            this.Text = "Chỉnh sửa  đơn hàng này";
            this.btnSave.Text = "Cập nhật";
            OrderService orderService = new OrderService();
            order = orderService.GetOrder(orderId);
            if (order != null)
            {
                if (orderDetails == null)
                {
                    OrderDetailService orderDetailService = new OrderDetailService();

                    orderDetails = new BindingList<OrderDetail>(orderDetailService.SelectOrderDetailByWhere(o => o.OrderId == order.Id));

                }
            }
            
        }
        private void AddOrder_Load(object sender, EventArgs e)
        {
            loadSomeData();
            SetupColumns();
            updateProductionRequestDetailCells();
            calculateTotal();
            
        }
        private void SetupColumns()
        {
            dgwOrderDetails.AutoGenerateColumns = false;

            if (orderDetails == null)
            {
                orderDetails = new BindingList<OrderDetail>();


            }
            var query = from orderDetail in orderDetails

                        select new ProductionRequestDetailModel
                        {
                            ProductId = orderDetail.ProductId,
                            AttributeId = orderDetail.AttributeId,
                            NumberUnit = orderDetail.NumberUnit,

                           
                            Price = orderDetail.Price,
                            Note = orderDetail.Note,
                            Total = (double)orderDetail.Price * orderDetail.NumberUnit
                        };

           
            dgwOrderDetails.DataSource = new BindingList<ProductionRequestDetailModel>(query.ToList());

            dgwOrderDetails.ReadOnly = false;

            DataGridViewComboBoxColumn productColumn = new DataGridViewComboBoxColumn();
            productColumn.Width = 150;
            productColumn.AutoComplete = false;

            productColumn.HeaderText = "Sản phẩm";
            productColumn.DataSource = products;
            productColumn.DisplayMember = "ProductName";
            //productColumn.Frozen = true;
            productColumn.ValueMember = "Id";

            dgwOrderDetails.Columns.Add(productColumn);

            DataGridViewComboBoxColumn productAttributeColumn = new DataGridViewComboBoxColumn();
            productAttributeColumn.Width = 150;
            productAttributeColumn.HeaderText = "Thuộc tính sản phẩm";

            productAttributeColumn.DataSource = baseAttributesAtRow;

            productAttributeColumn.DisplayMember = "AttributeName";
            //productColumn.Frozen = true;
            productAttributeColumn.ValueMember = "Id";

            dgwOrderDetails.Columns.Add(productAttributeColumn);



            DataGridViewTextBoxColumn numberUnitColumn = new DataGridViewTextBoxColumn();

            numberUnitColumn.Width = 100;
            numberUnitColumn.DataPropertyName = "NumberUnit";
            numberUnitColumn.HeaderText = "Số lượng";
            //numberUnitColumn.Frozen = true;
            //numberUnitColumn.ValueType = typeof(int);
            dgwOrderDetails.Columns.Add(numberUnitColumn);

            DataGridViewTextBoxColumn priceColumn = new DataGridViewTextBoxColumn();

            priceColumn.Width = 100;
            priceColumn.DataPropertyName = "Price";
            priceColumn.HeaderText = "Giá";
            //numberUnitColumn.Frozen = true;
            //priceColumn.ValueType = typeof(int);
            dgwOrderDetails.Columns.Add(priceColumn);

            DataGridViewTextBoxColumn totalColumn = new DataGridViewTextBoxColumn();

            totalColumn.Width = 100;
            totalColumn.DataPropertyName = "Total";
            totalColumn.HeaderText = "Tổng";
            //numberUnitColumn.Frozen = true;
            //totalColumn.ValueType = typeof(int);
            dgwOrderDetails.Columns.Add(totalColumn);

            DataGridViewTextBoxColumn noteColumn = new DataGridViewTextBoxColumn();

            noteColumn.DataPropertyName = "Note";
            noteColumn.Width = 100;
            noteColumn.HeaderText = "Ghi chú";
            //numberUnitColumn.Frozen = true;
            noteColumn.ValueType = typeof(string);
            dgwOrderDetails.Columns.Add(noteColumn);

            DataGridViewImageColumn deleteButton = new DataGridViewImageColumn();
            deleteButton.DataPropertyName = "DeleteButton";
            deleteButton.Image = Properties.Resources.erase;
            deleteButton.Width = 100;
            deleteButton.HeaderText = "Xóa";
            deleteButton.ReadOnly = true;
            deleteButton.ImageLayout = DataGridViewImageCellLayout.Normal;
        }
        

        private void dgwOrderDetails_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {
            //MessageBox.Show("Có lỗi nhập liệu xảy ra,vui lòng kiểm tra lại!");
        }

        private void dgwOrderDetails_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            DataGridView dgv = (DataGridView)sender;
            if (orderDetails == null)
            {
                orderDetails = new BindingList<OrderDetail>();
            }
            if (orderDetails.Count < dgwOrderDetails.RowCount)
            {
                OrderDetail orderDetail = new OrderDetail();
                orderDetails.Add(orderDetail);
            }
            if (dgv.CurrentCell.Value != null)
            {
                if (e.ColumnIndex == 0)
                {
                    
                    orderDetails[e.RowIndex].ProductId = (int)dgv.CurrentCell.Value;
                    ProductAttributeService productAttributeService = new ProductAttributeService();
                    List<ProductAttribute> productAttributes = productAttributeService.SelectProductAttributeByWhere(ba => ba.Id == orderDetails[e.RowIndex].ProductId);
                    baseAttributesAtRow = new BindingList<BaseAttribute>();
                    foreach(ProductAttribute pa in productAttributes)
                    {
                        baseAttributesAtRow.Add(pa.BaseAttribute);
                    }
                    DataGridViewComboBoxCell currentCell = (DataGridViewComboBoxCell)dgwOrderDetails.Rows[e.RowIndex].Cells[1];
                    currentCell.DataSource = baseAttributesAtRow;
                    if (baseAttributesAtRow.Count > e.RowIndex && baseAttributesAtRow.Count > 0)
                    {
                        orderDetails[e.RowIndex].AttributeId = baseAttributesAtRow[0].Id;
                        currentCell.Value = baseAttributesAtRow[0].Id;
                    }
                    

                }
                else if (e.ColumnIndex == 1)
                {
                    orderDetails[e.RowIndex].AttributeId = (int)dgv.CurrentCell.Value;
                }
                else if (e.ColumnIndex == 2)
                {
                    orderDetails[e.RowIndex].NumberUnit = (int)dgv.CurrentCell.Value;
                }
                else if (e.ColumnIndex == 3)
                {
                    orderDetails[e.RowIndex].Price = (double)dgv.CurrentCell.Value;
                }
                else if (e.ColumnIndex == 4)
                {
                    if (dgv.CurrentCell.Value != null)
                    {
                        orderDetails[e.RowIndex].Cost = (double)dgv.CurrentCell.Value;
                    }
                    
                }
                else if (e.ColumnIndex == 5)
                {
                    orderDetails[e.RowIndex].Note = (string)dgv.CurrentCell.Value;
                }
            }
            calculateTotal();
           
        }

        private void calculateTotal()
        {
            double totalNoTax = 0.0;
            double totalWithTax = 0.0;
            double discount = 0;
            double.TryParse(txtDiscount.Text, out discount);
            bool hasValue = false;

            for (int i = 0; i < dgwOrderDetails.RowCount; i++)
            {
                if (dgwOrderDetails.ColumnCount > 4)
                {
                    if (dgwOrderDetails.Rows[i].Cells[2].Value != null && dgwOrderDetails.Rows[i].Cells[3].Value != null)
                    {
                        dgwOrderDetails.Rows[i].Cells[4].Value = (int)dgwOrderDetails.Rows[i].Cells[2].Value * (double)dgwOrderDetails.Rows[i].Cells[3].Value;
                        hasValue = true;
                        totalNoTax += (double)dgwOrderDetails.Rows[i].Cells[4].Value;
                    }
                }
            }
            if (hasValue)
            {
                double vat = 0.0;
                double.TryParse(txtVAT.Text, out vat);
                totalWithTax = totalNoTax + vat - discount;
                lblSubTotal.Text = totalNoTax.ToString();
                lblGrantTotal.Text = totalWithTax.ToString();
            }
        }

        private void dgwOrderDetails_KeyUp(object sender, KeyEventArgs e)
        {
            if (sender is KeyPressAwareDataGridView)
            {
                KeyPressAwareDataGridView dgv = (KeyPressAwareDataGridView)sender;

                
            }
        }

        private void dgwOrderDetails_EditingControlShowing(object sender, DataGridViewEditingControlShowingEventArgs e)
        {

            if (dgwOrderDetails.CurrentCell.ColumnIndex == 0)
            {
                var source = new AutoCompleteStringCollection();
                String[] stringArray = Array.ConvertAll<Product, String>(products.ToArray(), delegate(Product row) { return (String)row.ProductName; });
                source.AddRange(stringArray);

                ComboBox prodCode = e.Control as ComboBox;
                if (prodCode != null)
                {
                    prodCode.DropDownStyle = ComboBoxStyle.DropDown;
                    prodCode.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
                    prodCode.AutoCompleteCustomSource = source;
                    prodCode.AutoCompleteSource = AutoCompleteSource.CustomSource;
                    prodCode.MaxDropDownItems = 5;

                }
                this.validator1.SetType(prodCode, Itboy.Components.ValidationType.Required);
            }
            else if (dgwOrderDetails.CurrentCell.ColumnIndex == 1)
            {
                if (baseAttributesAtRow != null)
                {
                    var source = new AutoCompleteStringCollection();
                    String[] stringArray = Array.ConvertAll<BaseAttribute, String>(baseAttributesAtRow.ToArray(), delegate(BaseAttribute row) { return (String)row.AttributeName; });
                    source.AddRange(stringArray);

                    ComboBox prodCode = e.Control as ComboBox;
                    if (prodCode != null)
                    {
                        prodCode.DropDownStyle = ComboBoxStyle.DropDown;
                        prodCode.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
                        prodCode.AutoCompleteCustomSource = source;
                        prodCode.AutoCompleteSource = AutoCompleteSource.CustomSource;
                        prodCode.MaxDropDownItems = 5;

                    }
                    this.validator1.SetType(prodCode, Itboy.Components.ValidationType.Required);
                }

            }
            else if (dgwOrderDetails.CurrentCell.ColumnIndex == 2)
            {
                TextBox numberOfUnit = e.Control as TextBox;
                this.validator1.SetRegularExpression(numberOfUnit, BHConstant.REGULAR_EXPRESSION_FOR_NUMBER);
                this.validator1.SetType(numberOfUnit, Itboy.Components.ValidationType.RegularExpression);
            }
            else if (dgwOrderDetails.CurrentCell.ColumnIndex == 3)
            {
                TextBox price = e.Control as TextBox;
                this.validator1.SetRegularExpression(price, BHConstant.REGULAR_EXPRESSION_FOR_CURRENCY);
                this.validator1.SetType(price, Itboy.Components.ValidationType.RegularExpression);
            }
            else if (dgwOrderDetails.CurrentCell.ColumnIndex == 4)
            {
                TextBox total = e.Control as TextBox;
                this.validator1.SetRegularExpression(total, BHConstant.REGULAR_EXPRESSION_FOR_CURRENCY);
                this.validator1.SetType(total, Itboy.Components.ValidationType.RegularExpression);
            }
            

        }

        private void dgwOrderDetails_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void CaptureScreen()
        {
            Graphics g1 = this.CreateGraphics();

            MyImage = new Bitmap(this.ClientRectangle.Width, this.ClientRectangle.Height, g1);

            Graphics g2 = Graphics.FromImage(MyImage);

            IntPtr dc1 = g1.GetHdc();

            IntPtr dc2 = g2.GetHdc();

            BitBlt(dc2, 0, 0, this.ClientRectangle.Width, this.ClientRectangle.Height, dc1, 0, 0, 13369376);

            g1.ReleaseHdc(dc1);

            g2.ReleaseHdc(dc2);

            //MyImage.Save(@"c:\PrintPage.jpg", ImageFormat.Jpeg);
        }
        private void btnPrintOrder_Click(object sender, EventArgs e)
        {
            printOrder();
            //CaptureScreen();
            //using (var dlg = new CoolPrintPreviewDialog())
            //{
            //    dlg.Document = this.printDoc;
            //    dlg.ShowDialog(this);
            //}
           
            
        }
        public void StartPrint(Stream streamToPrint, string streamType)
        {

            this.printDoc.PrintPage += new PrintPageEventHandler(printDoc_PrintPage);

            this.streamToPrint = streamToPrint;

            this.streamType = streamType;

            System.Windows.Forms.PrintDialog PrintDialog1 = new PrintDialog();

            PrintDialog1.AllowSomePages = true;

            PrintDialog1.ShowHelp = true;

            PrintDialog1.Document = printDoc;

            DialogResult result = PrintDialog1.ShowDialog();

            if (result == DialogResult.OK)
            {

                printDoc.Print();

                //docToPrint.Print();

            }
        }
        private void printDoc_PrintPage(object sender, PrintPageEventArgs e)
        {
            //System.Drawing.Image image = System.Drawing.Image.FromStream(this.streamToPrint);
            //;
            //int x = e.MarginBounds.X;

            //int y = e.MarginBounds.Y;

            //int width = image.Width;

            //int height = image.Height;

            //if ((width / e.MarginBounds.Width) > (height / e.MarginBounds.Height))
            //{

            //    width = e.MarginBounds.Width;

            //    height = image.Height * e.MarginBounds.Width / image.Width;

            //}

            //else
            //{

            //    height = e.MarginBounds.Height;

            //    width = image.Width * e.MarginBounds.Height / image.Height;

            //}

            //System.Drawing.Rectangle destRect = new System.Drawing.Rectangle(x, y, width, height);

            //e.Graphics.DrawImage(image, destRect, 0, 0, image.Width, image.Height, System.Drawing.GraphicsUnit.Pixel);
            e.Graphics.DrawImage(MyImage, 0, 0);
            MyImage.Save(@"c:\PrintPage.jpg", ImageFormat.Jpeg);
        }

        private void btnPrintXK_Click(object sender, EventArgs e)
        {
            printForStock();
        }
        private void printForStock()
        {
            object oMissing = System.Reflection.Missing.Value;
            object oEndOfDoc = "\\endofdoc"; /* \endofdoc is a predefined bookmark */

            //Start Word and create a new document.
            Microsoft.Office.Interop.Word._Application oWord;
            Word._Document oDoc;
            oWord = new Word.Application();
            oWord.Visible = true;
            oDoc = oWord.Documents.Add(ref oMissing, ref oMissing,
                ref oMissing, ref oMissing);

            //Insert a paragraph at the beginning of the document.
            Word.Paragraph oPara1;
            oPara1 = oDoc.Content.Paragraphs.Add(ref oMissing);
            oPara1.Range.Text = "Phiếu bán hàng";
            oPara1.Range.Font.Bold = 1;
            oPara1.Range.Font.Size = 30;
            oPara1.Format.SpaceAfter = 24;    //24 pt spacing after paragraph.
            oPara1.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;
            oPara1.Range.InsertParagraphAfter();

            Word.Paragraph oPara3;
            object oRng3 = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range;
            oPara3 = oDoc.Content.Paragraphs.Add(ref oRng3);
            oPara3.Range.Text = "Thông tin phiếu bán hàng";
            oPara3.Format.SpaceAfter = 6;
            oPara3.Range.Font.Size = 12;
            oPara3.Range.InsertParagraphAfter();

            Word.Table oTable2;
            Word.Range wrdRng2 = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range;
            oTable2 = oDoc.Tables.Add(wrdRng2, 3, 4, ref oMissing, ref oMissing);
            oTable2.Range.ParagraphFormat.SpaceAfter = 6;
            //oTable2.Borders.Enable = 1;

            oTable2.Cell(1, 1).Range.Text = "Mã phiếu:";
            oTable2.Cell(1, 1).Range.Bold = 1;
            oTable2.Cell(1, 1).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphRight;
            oTable2.Cell(1, 2).Range.Text = txtOrderCode.Text != null ? txtOrderCode.Text : "";
            oTable2.Cell(1, 2).Range.Bold = 0;
            oTable2.Cell(1, 2).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;

            oTable2.Cell(1, 3).Range.Text = "Khách hàng:";
            oTable2.Cell(1, 3).Range.Bold = 1;
            oTable2.Cell(1, 3).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphRight;

            if (cbxCustomer.SelectedValue != null)
            {
                oTable2.Cell(1, 4).Range.Text = customers.Where(cus => cus.Id == (int)cbxCustomer.SelectedValue).FirstOrDefault().CustomerName;
            }
            oTable2.Cell(1, 4).Range.Bold = 0;
            oTable2.Cell(1, 4).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;

            oTable2.Cell(2, 1).Range.Text = "Ngày lập:";
            oTable2.Cell(2, 1).Range.Bold = 1;
            oTable2.Cell(2, 1).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphRight;

            oTable2.Cell(2, 2).Range.Text = txtCreatedDate.Text;
            oTable2.Cell(2, 2).Range.Bold = 0;
            oTable2.Cell(2, 2).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;

            

            //Insert a paragraph at the end of the document.
            Word.Paragraph oPara2;
            object oRng = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range;
            oPara2 = oDoc.Content.Paragraphs.Add(ref oRng);
            oPara2.Range.Text = "Chi tiết phiếu bán hàng";
            oPara2.Format.SpaceAfter = 6;
            oPara3.Range.Font.Size = 12;
            oPara2.Range.InsertParagraphAfter();



            //Insert a table, fill it with data, and make the first row
            //bold and italic.
            Word.Table oTable;
            Word.Range wrdRng = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range;
            oTable = oDoc.Tables.Add(wrdRng, dgwOrderDetails.RowCount + 1, dgwOrderDetails.ColumnCount - 2, ref oMissing, ref oMissing);
            oTable.Range.ParagraphFormat.SpaceAfter = 6;
            oTable.Borders.Enable = 1;
            int r, c;


            for (r = 1; r <= dgwOrderDetails.RowCount; r++)
                for (c = 1; c <= dgwOrderDetails.ColumnCount - 2; c++)
                {
                    if (r == 1)
                    {
                        if (c == dgwOrderDetails.ColumnCount - 2)
                        {
                            oTable.Cell(r, c).Range.Text = dgwOrderDetails.Columns[dgwOrderDetails.ColumnCount - 1].HeaderText;
                        }
                        else
                        {
                            oTable.Cell(r, c).Range.Text = dgwOrderDetails.Columns[c - 1].HeaderText;
                        }
                    }
                    else
                    {
                        oTable.Cell(r, c).Range.Font.Bold = 0;
                        if (c - 1 == 0)
                        {
                            if (dgwOrderDetails.Rows[r - 2].Cells[c - 1].Value != null)
                            {
                                oTable.Cell(r, c).Range.Text = products.ToList().Where(p => p.Id == orderDetails[r - 2].ProductId).FirstOrDefault().ProductName;
                            }




                        }
                        else if (c - 1 == 1)
                        {
                            if (dgwOrderDetails.Rows[r - 2].Cells[c - 1].Value != null)
                            {
                                oTable.Cell(r, c).Range.Text = baseAttributesAtRow.ToList().Where(a => a.Id == (int)dgwOrderDetails.Rows[r - 2].Cells[c - 1].Value).FirstOrDefault().AttributeName;
                            }

                        }
                        else if (c - 1 == 2)
                        {
                            if (dgwOrderDetails.Rows[r - 2].Cells[c - 1].Value != null)
                            {
                                oTable.Cell(r, c).Range.Text = ((int)dgwOrderDetails.Rows[r - 2].Cells[c - 1].Value).ToString();
                            }

                        }
                        
                        else if (c - 1 == 3)
                        {
                            if (dgwOrderDetails.Rows[r - 2].Cells[dgwOrderDetails.ColumnCount - 1].Value != null)
                            {
                                oTable.Cell(r, c).Range.Text = ((string)dgwOrderDetails.Rows[r - 2].Cells[dgwOrderDetails.ColumnCount - 1].Value);
                            }

                        }
                    }


                }
            oTable.Rows[1].Range.Font.Bold = 1;
            oTable.Rows[1].Range.Font.Italic = 1;

            Word.Paragraph oPara4;
            object oRng4 = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range;
            oPara4 = oDoc.Content.Paragraphs.Add(ref oRng4);
            oPara4.Format.SpaceAfter = 6;
            oPara4.Range.Font.Size = 12;
            oPara4.Range.InsertParagraphAfter();
            Word.Table oTable3;
            Word.Range wrdRng3 = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range;
            
            Word.Paragraph oPara5;
            object oRng5 = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range;
            oPara5 = oDoc.Content.Paragraphs.Add(ref oRng5);
            oPara5.Format.SpaceAfter = 6;
            string createdBy = Global.CurrentUser.FullName;
            if (order != null)
            {
                createdBy = order.SystemUser.FullName;
            }
            oPara5.Range.Text = "Người lập phiếu: " + createdBy;
            oPara5.Range.Font.Size = 12;
            oPara5.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphRight;
            oPara5.Range.InsertParagraphAfter();
            
            oDoc.PrintPreview();
        }
        private void printOrder()
        {
            object oMissing = System.Reflection.Missing.Value;
            object oEndOfDoc = "\\endofdoc"; /* \endofdoc is a predefined bookmark */

            //Start Word and create a new document.
            Microsoft.Office.Interop.Word._Application oWord;
            Word._Document oDoc;
            oWord = new Word.Application();
            oWord.Visible = true;
            oDoc = oWord.Documents.Add(ref oMissing, ref oMissing,
                ref oMissing, ref oMissing);

            //Insert a paragraph at the beginning of the document.
            Word.Paragraph oPara1;
            oPara1 = oDoc.Content.Paragraphs.Add(ref oMissing);
            oPara1.Range.Text = "Phiếu bán hàng";
            oPara1.Range.Font.Bold = 1;
            oPara1.Range.Font.Size = 30;
            oPara1.Format.SpaceAfter = 24;    //24 pt spacing after paragraph.
            oPara1.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;
            oPara1.Range.InsertParagraphAfter();

            Word.Paragraph oPara3;
            object oRng3 = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range;
            oPara3 = oDoc.Content.Paragraphs.Add(ref oRng3);
            oPara3.Range.Text = "Thông tin phiếu bán hàng";
            oPara3.Format.SpaceAfter = 6;
            oPara3.Range.Font.Size = 12;
            oPara3.Range.InsertParagraphAfter();

            Word.Table oTable2;
            Word.Range wrdRng2 = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range;
            oTable2 = oDoc.Tables.Add(wrdRng2, 3, 4, ref oMissing, ref oMissing);
            oTable2.Range.ParagraphFormat.SpaceAfter = 6;
            //oTable2.Borders.Enable = 1;

            oTable2.Cell(1, 1).Range.Text = "Mã phiếu:";
            oTable2.Cell(1, 1).Range.Bold = 1;
            oTable2.Cell(1, 1).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphRight;
            oTable2.Cell(1, 2).Range.Text = txtOrderCode.Text != null ? txtOrderCode.Text : "";
            oTable2.Cell(1, 2).Range.Bold = 0;
            oTable2.Cell(1, 2).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;

            oTable2.Cell(1, 3).Range.Text = "Khách hàng:";
            oTable2.Cell(1, 3).Range.Bold = 1;
            oTable2.Cell(1, 3).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphRight;

            if (cbxCustomer.SelectedValue != null)
            {
                oTable2.Cell(1, 4).Range.Text = customers.Where(cus => cus.Id == (int)cbxCustomer.SelectedValue).FirstOrDefault().CustomerName;
            }
            oTable2.Cell(1, 4).Range.Bold = 0;
            oTable2.Cell(1, 4).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;

            oTable2.Cell(2, 1).Range.Text = "Ngày lập:";
            oTable2.Cell(2, 1).Range.Bold = 1;
            oTable2.Cell(2, 1).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphRight;

            oTable2.Cell(2, 2).Range.Text = txtCreatedDate.Text;
            oTable2.Cell(2, 2).Range.Bold = 0;
            oTable2.Cell(2, 2).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;

            oTable2.Cell(2, 3).Range.Text = "Khấu chi:";
            oTable2.Cell(2, 3).Range.Bold = 1;
            oTable2.Cell(2, 3).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphRight;

            oTable2.Cell(2, 4).Range.Text = txtDiscount.Text != null ? txtDiscount.Text : "";
            oTable2.Cell(2, 4).Range.Bold = 0;
            oTable2.Cell(2, 4).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;

            oTable2.Cell(3, 1).Range.Text = "VAT:";
            oTable2.Cell(3, 1).Range.Bold = 1;
            oTable2.Cell(3, 1).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphRight;

            oTable2.Cell(3, 2).Range.Text = txtVAT.Text != null ? txtVAT.Text : "";
            oTable2.Cell(3, 2).Range.Bold = 0;
            oTable2.Cell(3, 2).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;

            //Insert a paragraph at the end of the document.
            Word.Paragraph oPara2;
            object oRng = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range;
            oPara2 = oDoc.Content.Paragraphs.Add(ref oRng);
            oPara2.Range.Text = "Chi tiết phiếu bán hàng";
            oPara2.Format.SpaceAfter = 6;
            oPara3.Range.Font.Size = 12;
            oPara2.Range.InsertParagraphAfter();



            //Insert a table, fill it with data, and make the first row
            //bold and italic.
            Word.Table oTable;
            Word.Range wrdRng = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range;
            oTable = oDoc.Tables.Add(wrdRng, dgwOrderDetails.RowCount + 1, dgwOrderDetails.ColumnCount, ref oMissing, ref oMissing);
            oTable.Range.ParagraphFormat.SpaceAfter = 6;
            oTable.Borders.Enable = 1;
            int r, c;


            for (r = 1; r <= dgwOrderDetails.RowCount; r++)
                for (c = 1; c <= dgwOrderDetails.ColumnCount; c++)
                {
                    if (r == 1)
                    {
                        oTable.Cell(r, c).Range.Text = dgwOrderDetails.Columns[c - 1].HeaderText;
                    }
                    else
                    {
                        oTable.Cell(r, c).Range.Font.Bold = 0;
                        if (c - 1 == 0)
                        {
                            if (dgwOrderDetails.Rows[r - 2].Cells[c - 1].Value != null)
                            {
                                oTable.Cell(r, c).Range.Text = products.ToList().Where(p => p.Id == orderDetails[r - 2].ProductId).FirstOrDefault().ProductName;
                            }




                        }
                        else if (c - 1 == 1)
                        {
                            if (dgwOrderDetails.Rows[r - 2].Cells[c - 1].Value != null)
                            {
                                oTable.Cell(r, c).Range.Text = baseAttributesAtRow.ToList().Where(a => a.Id == (int)dgwOrderDetails.Rows[r - 2].Cells[c - 1].Value).FirstOrDefault().AttributeName;
                            }

                        }
                        else if (c - 1 == 2)
                        {
                            if (dgwOrderDetails.Rows[r - 2].Cells[c - 1].Value != null)
                            {
                                oTable.Cell(r, c).Range.Text = ((int)dgwOrderDetails.Rows[r - 2].Cells[c - 1].Value).ToString();
                            }

                        }
                        else if (c - 1 == 3)
                        {
                            if (dgwOrderDetails.Rows[r - 2].Cells[c - 1].Value != null)
                            {
                                oTable.Cell(r, c).Range.Text = ((double)dgwOrderDetails.Rows[r - 2].Cells[c - 1].Value).ToString();
                            }
                        }
                        else if (c - 1 == 4)
                        {
                            if (dgwOrderDetails.Rows[r - 2].Cells[c - 1].Value != null)
                            {
                                oTable.Cell(r, c).Range.Text = ((double)dgwOrderDetails.Rows[r - 2].Cells[c - 1].Value).ToString();
                            }

                        }
                        else if (c - 1 == 5)
                        {
                            if (dgwOrderDetails.Rows[r - 2].Cells[c - 1].Value != null)
                            {
                                oTable.Cell(r, c).Range.Text = ((string)dgwOrderDetails.Rows[r - 2].Cells[c - 1].Value);
                            }

                        }
                    }


                }
            oTable.Rows[1].Range.Font.Bold = 1;
            oTable.Rows[1].Range.Font.Italic = 1;

            Word.Paragraph oPara4;
            object oRng4 = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range;
            oPara4 = oDoc.Content.Paragraphs.Add(ref oRng4);
            oPara4.Format.SpaceAfter = 6;
            oPara4.Range.Font.Size = 12;
            oPara4.Range.InsertParagraphAfter();
            Word.Table oTable3;
            Word.Range wrdRng3 = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range;
            oTable3 = oDoc.Tables.Add(wrdRng3, 2, 2, ref oMissing, ref oMissing);
            oTable3.Range.ParagraphFormat.SpaceAfter = 6;
            oTable2.Borders.Enable = 1;

            oTable3.Cell(1, 1).Range.Text = "Giá trị phiếu hàng trước thuế và khấu hao:";
            oTable3.Cell(1, 1).Range.Bold = 1;
            oTable3.Cell(1, 1).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphRight;
            oTable3.Cell(1, 2).Range.Text = lblSubTotal.Text != null ? lblSubTotal.Text : "";
            oTable3.Cell(1, 2).Range.Bold = 0;
            oTable3.Cell(1, 2).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;

            oTable3.Cell(2, 1).Range.Text = "Giá trị phiếu hàng sau thuế và khấu hao:";
            oTable3.Cell(2, 1).Range.Bold = 1;
            oTable3.Cell(2, 1).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphRight;

            oTable3.Cell(2, 2).Range.Text = lblGrantTotal.Text != null ? lblGrantTotal.Text : "";
            oTable3.Cell(2, 2).Range.Bold = 0;
            oTable3.Cell(2, 2).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;

            Word.Paragraph oPara5;
            object oRng5 = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range;
            oPara5 = oDoc.Content.Paragraphs.Add(ref oRng5);
            oPara5.Format.SpaceAfter = 6;
            string createdBy = Global.CurrentUser.FullName;
            if (order != null)
            {
                createdBy = order.SystemUser.FullName;
            }
            oPara5.Range.Text = "Người lập phiếu: " + createdBy;
            oPara5.Range.Font.Size = 12;
            oPara5.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphRight;
            oPara5.Range.InsertParagraphAfter();
            
            oDoc.PrintPreview();
            
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        
    }
}