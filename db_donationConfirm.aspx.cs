using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// import namespaces for paypal to work
using System.Globalization;
using System.IO;
using System.Text;
using SpiceLogic.PayPalCtrlForWPS.Controls;

public partial class Default2 : System.Web.UI.Page
{
    // import donation class
    donationClass objLinq = new donationClass();

    // on page load, get query strings from previous page textboxes
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (MultiViewMyShop.ActiveViewIndex != 1)
            {
                lbl_name.Text += Request.QueryString["title"] + " " + Request.QueryString["fname"] + " " + Request.QueryString["lname"];
                lbl_address.Text += Request.QueryString["street"] + " " + Request.QueryString["app"];
                lbl_address2.Text += Request.QueryString["city"] + " " + Request.QueryString["province"] + " " + Request.QueryString["postal"];
                lbl_address3.Text += Request.QueryString["country"];
                lbl_phone.Text += Request.QueryString["phone"];
                lbl_cell.Text += Request.QueryString["cell"];
                lbl_email.Text += Request.QueryString["email"];
            }
        }

    }

    // donation sub
    // check if payment is cancelled or successful or any error
    protected void DonationButton1_PayPal_Returned(object sender, DonationReturnedEventArgs e)
    {
        // change view to viewpaymentcancelled if payment is cancelled
        if (e.IsPaymentCancelled)
            MultiViewMyShop.SetActiveView(ViewPaymentCancelled);

        // else on success payment, change view to viewpaymentcompleted
        else
        {
            // transaction id
            lblTransactionID.Text = e.TransactionID;

            // payment status - success or fail
            lblResult.Text = e.PDT.Status.ToString();

            // change view to viewpaymentcomplete
            MultiViewMyShop.SetActiveView(ViewPaymentCompleted);

            switch (e.PDT.Status)
            {
                // display message if payment is successful
                case PayPalPDT.StatusCodes.SUCCESS:
                    lblThanks.Text = string.Format("Thank you {0} {1}! for your payment.",
                                                   e.BuyerInfo.FirstName, e.BuyerInfo.LastName);

                    // display amount
                    lblPaidAmount.Text = e.PaymentInfo.McGross.ToString(CultureInfo.InvariantCulture);

                    break;
                
                // if fail
                case PayPalPDT.StatusCodes.NOT_Handling_PDT:
                    lblThanks.Text =
                        @"Thank you for the payment. As PDT is not being handled, 
         no transaction data is available. But you will get email about your purchased
         product receipt and shipping information.";
                    break;
            }

            // get textboxes values from previous page - query strings
            string title = Request.QueryString["title"];
            string fname = Request.QueryString["fname"];
            string lname = Request.QueryString["lname"];
            string street = Request.QueryString["street"];
            string app = Request.QueryString["app"];
            string city = Request.QueryString["city"];
            string province = Request.QueryString["province"];
            string postal = Request.QueryString["postal"];
            string country = Request.QueryString["country"];
            string phone = Request.QueryString["phone"];
            string cell = Request.QueryString["cell"];
            string email = Request.QueryString["email"];

            // save to database
            objLinq.commitInsert(title, fname, lname, street, app, city, province, country, postal, phone, cell, email, Decimal.Parse(e.PaymentInfo.McGross.ToString(CultureInfo.InvariantCulture)), e.TransactionID);
        }
    }

    // sub to donation page
    protected void subBack(object sender, EventArgs e)
    {
        Response.Redirect("donation.aspx");
    }

    // sub to home page
    protected void subHome(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}