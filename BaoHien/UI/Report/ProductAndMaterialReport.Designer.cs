﻿namespace BaoHien.UI
{
    partial class ProductAndMaterialReport
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnSearch = new System.Windows.Forms.Button();
            this.cbmProductTypes = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.dgwStockEntranceList = new System.Windows.Forms.DataGridView();
            this.label8 = new System.Windows.Forms.Label();
            this.dtpTo = new System.Windows.Forms.DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.dtpFrom = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgwStockEntranceList)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.dtpTo);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.dtpFrom);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.btnSearch);
            this.groupBox1.Controls.Add(this.cbmProductTypes);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Location = new System.Drawing.Point(19, 16);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(1053, 63);
            this.groupBox1.TabIndex = 17;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thông tin tạo báo cáo";
            // 
            // btnSearch
            // 
            this.btnSearch.Location = new System.Drawing.Point(978, 22);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(69, 25);
            this.btnSearch.TabIndex = 1;
            this.btnSearch.Text = "Báo Cáo";
            this.btnSearch.UseVisualStyleBackColor = true;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // cbmProductTypes
            // 
            this.cbmProductTypes.FormattingEnabled = true;
            this.cbmProductTypes.Location = new System.Drawing.Point(655, 25);
            this.cbmProductTypes.Name = "cbmProductTypes";
            this.cbmProductTypes.Size = new System.Drawing.Size(268, 21);
            this.cbmProductTypes.TabIndex = 9;
            this.cbmProductTypes.SelectedIndexChanged += new System.EventHandler(this.cbmProductTypes_SelectedIndexChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(577, 28);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(58, 13);
            this.label5.TabIndex = 8;
            this.label5.Text = "Sản phẩm:";
            // 
            // dgwStockEntranceList
            // 
            this.dgwStockEntranceList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgwStockEntranceList.Location = new System.Drawing.Point(19, 120);
            this.dgwStockEntranceList.Name = "dgwStockEntranceList";
            this.dgwStockEntranceList.Size = new System.Drawing.Size(1053, 501);
            this.dgwStockEntranceList.TabIndex = 21;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Arial", 8.25F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(16, 92);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(324, 14);
            this.label8.TabIndex = 20;
            this.label8.Text = "Chú ý: mặc định sẽ là tình trạng hiện tại trong kho và thành phẩm";
            // 
            // dtpTo
            // 
            this.dtpTo.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpTo.Location = new System.Drawing.Point(345, 26);
            this.dtpTo.Name = "dtpTo";
            this.dtpTo.Size = new System.Drawing.Size(149, 20);
            this.dtpTo.TabIndex = 14;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(262, 30);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(59, 13);
            this.label2.TabIndex = 13;
            this.label2.Text = "Đến ngày :";
            // 
            // dtpFrom
            // 
            this.dtpFrom.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpFrom.Location = new System.Drawing.Point(87, 27);
            this.dtpFrom.Name = "dtpFrom";
            this.dtpFrom.Size = new System.Drawing.Size(132, 20);
            this.dtpFrom.TabIndex = 11;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(29, 29);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(52, 13);
            this.label1.TabIndex = 12;
            this.label1.Text = "Từ ngày :";
            // 
            // ProductAndMaterialReport
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.dgwStockEntranceList);
            this.Controls.Add(this.label8);
            this.Name = "ProductAndMaterialReport";
            this.Size = new System.Drawing.Size(1084, 641);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgwStockEntranceList)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnSearch;
        private System.Windows.Forms.ComboBox cbmProductTypes;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.DataGridView dgwStockEntranceList;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.DateTimePicker dtpTo;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DateTimePicker dtpFrom;
        private System.Windows.Forms.Label label1;
    }
}
