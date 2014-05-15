<%@ Page Title="" Language="C#" MasterPageFile="~/framework.master" AutoEventWireup="true" CodeFile="db_donationConfirm.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="SpiceLogicPayPalStd" Namespace="SpiceLogic.PayPalCtrlForWPS.Controls" TagPrefix="cc1" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">

    <%-- using multiview with 3 views --%>

    <asp:MultiView ID="MultiViewMyShop" runat="server" ActiveViewIndex="0" >
        <asp:View ID="ViewBuyNow" runat="server">

            <%-- confirm donation text and paragraph --%>
            <h1>Confirm Donation</h1> <br />
            <h3>Please confirm your donation.</h3> <br />

            <p>
                If you want to make the following donation, please click the "Paypal" button to submit for credit card processing.
                All donations are non-refundable and non-transferable.
            </p>

            <br /><br />

            <%-- name address phone mobile and email from previous page textbox --%>
            Name: <asp:Label ID="lbl_name" runat="server" /><br /><br />

            Address: <asp:Label ID="lbl_address" runat="server" /><br />
            <asp:Label ID="lbl_address2" runat="server" /><br />
            <asp:Label ID="lbl_address3" runat="server" /><br /><br />

            Phone: <asp:Label ID="lbl_phone" runat="server" /><br /><br />

            Mobile: <asp:Label ID="lbl_cell" runat="server" /><br /><br />

            Email: <asp:Label ID="lbl_email" runat="server" /><br /><br />

            <%-- donation button --%>
            <cc1:DonationButton ID="btn_1" runat="server" BusinessEmailOrMerchantID="y_b_333@hotmail.com" OnPayPal_Returned="DonationButton1_PayPal_Returned" DonationName="Lennox" BuyerInfo-Country="NZ" >
                <PayPalReturn PDTAuthenticationToken="Cztsw5CvLk7eT8odT4bMAFqSYOTQpoSF7Cv1kyEx335y-XAsMfRB4Af4wMC" />
                <PayPalFormSubmission PostActionUrl="https://www.sandbox.paypal.com/cgi-bin/webscr" PostDestination="PayPal_Sandbox" />
            </cc1:DonationButton>

            <br /><br />
        </asp:View>

        <%-- view payment complete view --%>
        <asp:View ID="ViewPaymentCompleted" runat="server">
            
            <%-- thank you message --%>
            <asp:Label ID="lblThanks" runat="server" Text="Thank you Message" Font-Bold="True"></asp:Label>
            <br /><br />

            <%-- payment result - success or fail --%>
            Payment Result : <asp:Label ID="lblResult" runat="server"></asp:Label>
            <br /><br />

            <%-- payment id --%>
            Transaction ID : <asp:Label ID="lblTransactionID" runat="server"></asp:Label>
            <br /><br />
            
            <%-- donation amount --%>
            Donated Amount : <asp:Label ID="lblPaidAmount" runat="server"></asp:Label>
            <br /><br />

            <%-- paragraph --%>
            <p>Lennox & Addington County General Hospital Foundation is appreciative of every donation made to aid the efforts of the hospital.</p>

            <%-- link button link to home page --%>
            <div style="text-align:right;">
                <asp:LinkButton ID="btn_home" runat="server" Text="Back To Home Page" OnClick="subHome" />
            </div>
                
            </asp:View>

            <%-- view when payment is cancelled --%>
            <asp:View ID="ViewPaymentCancelled" runat="server">
                <asp:Label ID="lbl_cancel" runat="server" Text="Donation cancelled!"></asp:Label>
                
                <%-- link button to go back to donation page --%>
                <div style="text-align:right;">
                    <asp:LinkButton ID="btn_back" runat="server" Text="Back To Donation Page" OnClick="subBack" />
                </div>
            </asp:View>
        </asp:MultiView>

</asp:Content>

