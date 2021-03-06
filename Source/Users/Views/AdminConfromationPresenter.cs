﻿///Copyright       : Copyright (c) Sopra Group India Ltd 
///Project         : Timeless Tributes
///File Name       :TributesPortal.Users.Views.AdminConfromationPresenter.cs
///Author          : 
///Creation Date   : 
///Description     : This is the Presenter class for viewing the confirmation page for an admin request.
///Audit Trail     : Date of Modification  Modified By         Description

using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Practices.ObjectBuilder;
using Microsoft.Practices.CompositeWeb;
using TributesPortal.BusinessEntities;


namespace TributesPortal.Users.Views
{
    public class AdminConfromationPresenter : Presenter<IAdminConfromation>
    {

        // NOTE: Uncomment the following code if you want ObjectBuilder to inject the module controller
        //
        private UsersController _controller;
        public AdminConfromationPresenter([CreateNew] UsersController controller)
        {
            _controller = controller;
        }

        public override void OnViewLoaded()
        {
            // TODO: Implement code that will be executed every time the view loads
        }

        public override void OnViewInitialized()
        {
            // TODO: Implement code that will be executed the first time the view loads
        }

        public int OnConformAdmin(Tributes objTributesUserInfo, SessionValue objGenralUserInfo, bool _Accept)
        {
            _controller.ConformAdmin(objTributesUserInfo, objGenralUserInfo,_Accept);
            return 0;
        }

        public void GetTributeByID(TributesUserInfo _TributesUserInfo)
        {
            _controller.GetTributeByID(_TributesUserInfo);
        }
        


        // TODO: Handle other view events and set state in the view
    }
}




