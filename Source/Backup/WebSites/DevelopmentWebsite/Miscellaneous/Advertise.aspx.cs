﻿///Copyright       : Copyright (c) Sopra Group India Ltd 
///Project         : Timeless Tributes
///File Name       : TributePortal.DevelopmentWebsite.Miscellaneous.Advertise.aspx.cs
///Author          : 
///Creation Date   : 
///Description     : This page informs about how to advertise on the site to the site visitors
///Audit Trail     : Date of Modification  Modified By         Description

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
using Microsoft.Practices.ObjectBuilder;
using TributesPortal.Miscellaneous.Views;
using TributesPortal.BusinessEntities;
using TributesPortal.Utilities;

public partial class Miscellaneous_Advertise : System.Web.UI.Page, IAdvertise
{
    private AdvertisePresenter _presenter;
    protected string _userName;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            YTPanel.Visible = true;
            StateManager stateManager = StateManager.Instance;
            SessionValue objSessionvalue = (SessionValue)stateManager.Get("objSessionvalue", StateManager.State.Session);

            if (!Equals(objSessionvalue, null))
            {
                _userName = objSessionvalue.UserName;
                //spanLogout.InnerHtml = "<a href='Logout.aspx'>Log out</a>";
                //myprofile.Visible = true;
                //myprofile.HRef = Session["APP_BASE_DOMAIN"] + "adminmytributeshome.aspx";
            }
            else
            {
                //spanLogout.InnerHtml = "<a href='javascript: void(0);' onclick='UserLoginModalpopup(location.href,document.title);'>Log in</a>";
                //myprofile.Visible = false;
            }
            if (Request.RawUrl.ToLower().Contains("advertise.aspx"))
            {
                YTPanel.Visible = false;
            }
            //this._presenter.OnViewInitialized();
        }
    }

    [CreateNew]
    public AdvertisePresenter Presenter
    {
        set
        {
            this._presenter = value;
            this._presenter.View = this;
        }
    }

    // TODO: Forward events to the presenter and show state to the user.
    // For examples of this, see the View-Presenter (with Application Controller) QuickStart:
    //		ms-help://MS.VSCC.v80/MS.VSIPCC.v80/ms.practices.wcsf.2007jun/wcsf/html/02-480-ViewPresenter.htm

}


