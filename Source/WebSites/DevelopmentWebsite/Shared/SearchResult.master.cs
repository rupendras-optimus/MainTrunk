///Copyright       : Copyright (c) Sopra Group India Ltd 
///Project         : Timeless Tributes
///File Name       : TributePortal.DevelopmentWebsite.Shared.SearchResult.aspx.cs
///Author          : 
///Creation Date   : 
///Description     : This page provides the default layout for the search pages
///Audit Trail     : Date of Modification  Modified By         Description

#region USING DIRECTIVES

using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using TributesPortal.Utilities;
using TributesPortal.BusinessEntities;
using TributesPortal.Users;
//using Facebook;
//using Facebook.Rest;
//using Facebook.Web;
//using Facebook.Session;

#endregion


public partial class Shared_SearchResult : System.Web.UI.MasterPage
{

    #region CLASS VARIABLES

    //protected string _UserName;
    private int _UserID;
    private SessionValue objSessionValue = null;
    #endregion


    #region EVENTS

    protected void Page_Load(object sender, EventArgs e)
    {
        //_connectSession = new ConnectSession(ConfigurationManager.AppSettings["APIKey"], ConfigurationManager.AppSettings["Secret"]);
        //// get the User detail from the Session
        //GetValuesFromSession();

        //if(myprofile.Visible)
        //    myprofile.HRef = Session["APP_BASE_DOMAIN"] + "tributes.aspx";

        // Set controls visibility\
        if (!IsPostBack)
        {
            if (ConfigurationManager.AppSettings["ApplicationType"].ToString().ToLower() == "yourmoments")
            {
                txtSearchKeyword.Text = "Enter the name of a Website";
            }
        }
        

        SetControlsVisibility();
    }

    protected void btnSearchSubmit_Click(object sender, ImageClickEventArgs e)
    {
        SearchTribute SerachParam = null;

        StateManager stateManager = StateManager.Instance;
        SerachParam = (SearchTribute)stateManager.Get(PortalEnums.SearchEnum.Search.ToString(), StateManager.State.Session);

        if ((Page.GetType().Name.ToLower() == PortalEnums.PageNameEnum.tribute_alltribute_aspx.ToString()) || (SerachParam == null))
        {
            SerachParam = new SearchTribute();

            SerachParam.SearchString = txtSearchKeyword.Text.Trim();
            SerachParam.TributeType = "All Tributes";
            SerachParam.SearchType = PortalEnums.SearchEnum.Basic.ToString();
            SerachParam.SortOrder = PortalEnums.Sorting.DESC.ToString();

            stateManager.Add(PortalEnums.SearchEnum.Search.ToString(), SerachParam, StateManager.State.Session);
        }
        else
        {
            if (SerachParam != null)
            {
                SerachParam.SearchString = txtSearchKeyword.Text.Trim();

                SerachParam.TributeType += " Tributes";
                SerachParam.SearchType = PortalEnums.SearchEnum.Basic.ToString();
                SerachParam.SortOrder = PortalEnums.Sorting.DESC.ToString();
                stateManager.Add(PortalEnums.SearchEnum.Search.ToString(), SerachParam, StateManager.State.Session);
            }
        }

        // Redirect to the Search Result page
        Response.Redirect(Redirect.RedirectToPage(Redirect.PageList.SearchResult.ToString()));
    }

    protected void popuplbtnSendemail_Click(object sender, EventArgs e)
    {
        //GenralUserInfo objGenralUserInfo = new GenralUserInfo();
        //UserInfo objUserInfo = new UserInfo();
        //objUserInfo.UserEmail = txtLoginEmail1.Text;
        //objGenralUserInfo.RecentUsers = objUserInfo;
        //UsersController objUsersController = new UsersController();
        //objUsersController.CheckAndSendPassword(objGenralUserInfo, false);
        //txtLoginEmail1.Text = string.Empty;
        //Response.Redirect(Redirect.RedirectToPage(Redirect.PageList.Inner2LoginPage.ToString()));
    }

    #endregion


    #region METHODS

    /// <summary>
    /// This function will get the User Details from the session
    /// </summary>
    private void GetValuesFromSession()
    {
        try
        {
            // Create StateManager instance
            StateManager objStateManager = StateManager.Instance;

            //to get logged in user name from session as user is logged in user
            objSessionValue = (SessionValue)objStateManager.Get(PortalEnums.SessionValueEnum.objSessionvalue.ToString(), StateManager.State.Session);

            if (!Equals(objSessionValue, null))
            {
                _UserID = objSessionValue.UserId;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    /// <summary>
    /// Set Visibility of control on the basis of page
    /// </summary>
    private void SetControlsVisibility()
    {
        try
        {
            YTPanel.Visible = true;
            // To display login and logout option based on the Session value for the user.
            //if (!Equals(objSessionValue, null))
            //{
            //    if (_connectSession.IsConnected())
            //    {
            //        spanLogout.InnerHtml = "<a href=\"#\" onclick=\"FB.Connect.logoutAndRedirect('" + Session["APP_BASE_DOMAIN"] + "Logout.aspx')\">" +
            //          "   <img id=\"fb_logout_image\" src=\"http://static.ak.fbcdn.net/images/fbconnect/logout-buttons/logout_small.gif\" alt=\"Connect\"/>" +
            //          "</a>";
            //    }
            //    else
            //    {
            //        spanLogout.InnerHtml = "<a href='Logout.aspx'>Log out</a>";
            //    }
            //}
            //else
            //{
            //    spanLogout.InnerHtml = "<a href='javascript: void(0);' onclick='UserLoginModalpopup(location.href,document.title);'>Log in</a>";
            //}

            // Set visibility on the basis of the name of the page
            if (Page.GetType().Name.ToLower() == PortalEnums.PageNameEnum.tribute_advancesearch_aspx.ToString())
            {
                divSearch.Visible = false;
                YTPanel.Visible = false;
            }
            else if (Page.GetType().Name.ToLower() == PortalEnums.PageNameEnum.tribute_searchresult_aspx.ToString())
            {
                divSearch.Visible = true;
                YTPanel.Visible = false;
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    #endregion

}