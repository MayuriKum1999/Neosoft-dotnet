<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Cat.aspx.cs" Inherits="Web.Cat" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <h1>Cats Page</h1>
        </div>
    <div>
        <form>
            <asp:ValidationSummary ID="ValidationSummary1" DisplayMode="BulletList" ShowSummary="true" HeaderText="Errors:" ForeColor="Red" runat="server" />
          <div class="form-group row">
              <asp:Label for="tb_Name" ID="lbl_Name" runat="server" Text="Name" class="col-sm-2 col-form-label"></asp:Label>
            <div class="col-sm-10">
                <asp:TextBox ID="tb_Name" runat="server" class="form-control" placeholder="Please enter the name of the cat"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tb_Name" runat="server" Text="Name cannot be empty" ErrorMessage="Name cannot be empty" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
          </div>
          <div class="form-group row">
              <asp:Label for="tb_Dob" ID="lbl_Dob" runat="server" Text="Date of Birth" class="col-sm-2 col-form-label"></asp:Label>
            <div class="col-sm-10">
                <asp:TextBox ID="tb_Dob" runat="server" class="form-control" placeholder="dd/mm/yyyy"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="RangeValidator" Type="Date" MaximumValue="DateTime.Now.Add "></asp:RangeValidator>
            </div>
          </div>
            <div class="form-group row">
              <asp:Label for="Gender" ID="lbl_Gender" runat="server" Text="Gender" class="col-sm-2 col-form-label"></asp:Label>
            <div class="col-sm-10">
                <asp:RadioButton ID="rb_Male" GroupName="Gender" Text="Male" runat="server" />
                <asp:RadioButton ID="rb_Female" GroupName="Gender" Text="Female" runat="server" />
            </div>
          </div>
            <div class="form-group row">
                <asp:Label for="Gender" ID="lbl_CatType" runat="server" Text="Cat type" class="col-sm-2 col-form-label"></asp:Label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="dd_CatType" class="form-control" runat="server">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group row">
                <asp:Label for="Gender" ID="lbl_FurType" runat="server" Text="Fur Type" class="col-sm-2 col-form-label"></asp:Label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="dd_FurType" class="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
          <div class="form-group row">
            <div class="col-sm-10 offset-sm-2">
                <asp:Button ID="btn_Add" class="btn btn-primary" runat="server" Text="Add" OnClick="btn_Add_Click" />
            </div>
              <asp:GridView ID="gv_cats" runat="server" BackColor="WhiteSmoke"> </asp:GridView>
              
          </div>
            <asp:Label ID="lbl_Display" runat="server" Text=""></asp:Label>
    </form>
    </div>

</asp:Content>        
