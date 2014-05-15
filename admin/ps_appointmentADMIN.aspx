<%@ Page Title="" Language="C#" MasterPageFile="~/framework.master" AutoEventWireup="true" CodeFile="ps_appointmentADMIN.aspx.cs" Inherits="ps_appointmentADMIN" %>
<%-- Page by Puneet Saini --%>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_content" Runat="Server">
      <%-- page instructions --%>
    <asp:Label ID="lbl" runat="server" Text="Click on cancel to delete any existing appointment." />

    <%-- message of success failure to commit to DB goes here --%>
     <asp:Label ID="lbl_msg" runat="server" />
    <div>
        <%-- panel displaying all the booked appointments --%>
        <asp:Panel ID="pnl_all" runat="server" GroupingText="All Appointments">
           <table border="1" style="font-family:Arial;border:1px solid #C0C0C0;background-color:#D8D8D8">
                <thead>
                    <tr style ="background-color:#6aabbf">
                        <th><asp:Label ID="lbl_patname" runat="server" Text="Patient Name" /></th>
                        <th><asp:Label ID="lbl_patID" runat="server" Text="Health Card no." /></th>
                        <th><asp:Label ID="lbl_dept" runat="server" Text="Department" /></th>
                        <th><asp:Label ID="lbl_doctor" runat="server" Text="Doctor Name" /></th>
                        <th><asp:Label ID="lbl_reason" runat="server" Text="Reason" /></th>
                        <th><asp:Label ID="lbl_date" runat="server" Text="Date" /></th>
                        <th><asp:Label ID="lbl_time" runat="server" Text="Time" /></th>
                         <th><asp:Label ID="lbl_option" runat="server" Text="Option" /></th>
                        <th><asp:Label ID="lbl_option2" runat="server" Text="Option" /></th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpt_all" runat="server">
                        <ItemTemplate>
                            <tr>
                                 <td><%#Eval("pat_name") %> </td>
                                 <td><%#Eval("at_hcard") %> </td>
                                 <td><%#Eval("at_clinic") %> </td>
                                 <td><%#Eval("at_doc_name") %></td>
                                 <td><%#Eval("at_reason") %> </td>
                                 <td><%#Eval("at_date","{0:d}") %> </td>
                                <td><%#Eval("at_time") %> </td>
                                 <td>
                              <asp:LinkButton ID="btn_delete" runat="server" Text="Cancel" CommandName="Delete" CommandArgument='<%#Eval("at_id") %>'  OnCommand="subAdmin" />
                            </td>
                                <td>
                                 <asp:LinkButton ID="btn_update" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Eval("at_id") %>' OnCommand="subAdmin" />
                                    </td>
                          
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>
        <%--Panel call to update any  appointment --%>
        <asp:Panel ID="pnl_update" runat="server" GroupingText="Update Appointment">
            <table>
                <thead>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lbl_update" runat="server" Text="To change the date or time of an appointment, click on update" />
                        </td>
                    </tr>                             
                    
                </thead>
                <tbody>
                    <%--Repeater to display the update appointments --%>
                    <asp:Repeater ID="rpt_update" runat="server" OnItemCommand="subUpDel">
                        <ItemTemplate>
                            <tr>
                                <td><asp:HiddenField ID="hdf_idU" runat="server" Value='<%#Eval("at_id") %>' />
                                   <asp:Label ID="lbl_patnameU" runat="server" Text="Patient Name:" />
                                <asp:TextBox ID="txt_patnameU" runat="server" Text='<%#Eval("pat_name") %>' /></td></tr>
                                                            
                            <tr>
                                 <td><asp:Label ID="lbl_hcardU" runat="server" Text="Health Card no.:" /><asp:TextBox ID="txt_hcardU" runat="server" Text='<%#Eval("at_hcard") %>' />
                                 </td></tr>
                               <tr> 
                                   <td><asp:Label ID="lbl_deptU" runat="server" Text="Department:" /><asp:TextBox ID="txt_deptU" runat="server" Text='<%#Eval("at_clinic") %>' />
                                   </td>  </tr>
                              <tr>   
                                  <td><asp:Label ID="lbl_docU" runat="server" Text="Doctor:" /><asp:TextBox ID="txt_docnameU" runat="server" Text='<%#Eval("at_doc_name") %>' />
                                  </td> </tr>
                            <tr>                                 
                                <td><asp:Label ID="lbl_reasonU" runat="server" Text="Reason:" /><asp:TextBox ID="txt_reasonU" runat="server" Text='<%#Eval("at_reason") %>' />
                                </td></tr>
                              <tr>  
                                  <td><asp:Label ID="lbl_dateU" runat="server" Text="Date:" />                                            <asp:TextBox ID="txt_dateU" runat="server" Text='<%#Eval("at_date") %>' /></td></tr>
                             <tr> <td><asp:Label ID="lbl_timeU" runat="server" Text="Time:" />
                                   <asp:TextBox ID="txt_timeU" runat="server" Text='<%#Eval("at_time") %>' /></td></tr>
                                                                                       
                            <tr>
                                <td colspan="3">
                                    <asp:Button ID="btn_update" runat="server" Text="Update"  CommandName="Update"   />

                                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                 
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>
         <%--Panel call to delete any unwanted appointment --%>
        <asp:Panel ID="pnl_delete" runat="server" GroupingText="Cancel Appointment">
            <table>
                <thead>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lbl_delete" runat="server" Text="Are you sure you want to delete this ?" />
                        </td>
                    </tr>
                    <tr>
                        <th><asp:Label ID="lbl_patnameD" runat="server" Text="Patient Name" /></th>
                        <th><asp:Label ID="lbl_patIdD" runat="server" Text="Health Card no." /></th>                      
                        <th><asp:Label ID="lbl_deptD" runat="server" Text="Department" /></th>
                        <th><asp:Label ID="lbl_doctorD" runat="server" Text="Doctor" /></th>
                        <th><asp:Label ID="lbl_reasonD" runat="server" Text="Reason" /></th>
                        <th><asp:Label ID="lbl_dateD" runat="server" Text="DateTime" /></th>
                       
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpt_delete" runat="server" OnItemCommand="subUpDel">
                        <ItemTemplate>
                            <tr>
                                <td><asp:HiddenField ID="hdf_idD" runat="server" Value='<%#Eval("at_id") %>' />
                                <asp:Label ID="txt_patnameD" runat="server" Text='<%#Eval("pat_name") %>' />
                                    </td>
                                <td><asp:Label ID="txt_patIdD" runat="server" Text='<%#Eval("at_hcard") %>' /></td>
                                 <td><asp:Label ID="txt_deptD" runat="server" Text='<%#Eval("at_clinic") %>' /></td>  
                                 <td><asp:Label ID="txt_docnameD" runat="server" Text='<%#Eval("at_doc_name") %>' /></td>                                      
                                 <td><asp:Label ID="txt_reasonD" runat="server" Text='<%#Eval("at_reason") %>' /></td>
                                 <td><asp:Label ID="txt_dateD" runat="server" Text='<%#Eval("at_date") %>' /></td>
                                
                                
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" />
                                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>
    </div>
</asp:Content>

