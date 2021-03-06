﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageCropper.aspx.cs" Inherits="ModelPopup_ImageCropper" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Your <%=ConfigurationManager.AppSettings["ApplicationWord"].ToString()%> - Image Cropper</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="Content-Language" content="en-ca" />
    <meta http-equiv="imagetoolbar" content="false" />
    <meta name="robots" content="index,follow" />
    <meta name="MSSmartTagsPreventParsing" content="true" />
    <!-- really basic, generic html class stylesheet -->
    <link rel="stylesheet" type="text/css" media="screen, projection" href="../assets/<%= ConfigurationManager.AppSettings["CssDir"].ToString() %>/default.css" />
    <!-- default grid layout stylesheet -->
    <link rel="stylesheet" type="text/css" media="screen, projection" href="../assets/<%= ConfigurationManager.AppSettings["CssDir"].ToString() %>/layouts/centered1024_1.css" />
    <!-- print-friendly stylesheet -->
    <link rel="stylesheet" type="text/css" media="print" href="../assets/<%= ConfigurationManager.AppSettings["CssDir"].ToString() %>/print.css" />
    <!-- screen elements stylesheet should be here -->
    <link rel="stylesheet" type="text/css" href="../assets/<%= ConfigurationManager.AppSettings["CssDir"].ToString() %>/screen.css" />
    <link rel="stylesheet" type="text/css" media="screen, projection" href="../assets/<%= ConfigurationManager.AppSettings["CssDir"].ToString() %>/cropper.css" />
    <!-- JS libraries -->

    <script src="../assets/scripts/cropper/prototype.js" type="text/javascript"></script>

    <script src="../assets/scripts/cropper/scriptaculous.js?load=builder,dragdrop" type="text/javascript"></script>

    <script src="../assets/scripts/cropper/cropper.js" type="text/javascript"></script>

    <script type="text/javascript">
        /*window.addEvent('load', function() {	
        buttonStyles();
        thumbStyles();
        hrFix();    
        fieldsetFix();
        }); */
        function onEndCrop(coords, dimensions) {
            $('hdnX1').value = coords.x1;
            $('hdnY1').value = coords.y1;
            $('hdnX2').value = coords.x2;
            $('hdnY2').value = coords.y2;
            $('hdnWidth').value = dimensions.width;
            $('hdnHeight').value = dimensions.height;
        }

        Event.observe(window, 'load', function() {
            new Cropper.ImgWithPreview(
	            'img',
	            {
	                previewWrap: 'previewWrap',
	                minWidth: 194,
	                minHeight: 194,
	                ratioDim: { x: 194, y: 194 },
	                onEndCrop: onEndCrop
	            }
            );
            errorToParent();
        });

        function errorToParent() {
            childError = document.getElementsByClassName('yt-Error');
            if (childError.length > 0) {
                parentError = window.parent.document.getElementById('mb_Error_ImgCropper');
                if ($('lblErrMsg')) {
                    parentError.className = 'yt-Error';
                    parentError.innerHTML = childError[0].innerHTML;
                } else {
                    parentError.innerHTML = '&nbsp';
                    parentError.className = '';
                }
                window.parent.$('yt-CropperFrame').style.top = '0'; // Refresh DOM to fix FF bug
            }
        }

    </script>

    <style type="text/css">
        .yt-ProfilePhotoFrame
        {
            background: url(../assets/images/bg_ProfilePhotoFrame.gif) no-repeat 0 0;
            z-index: 500;
            display: block;
            width: 130px;
            height: 130px;
            position: absolute;
            top: 0;
            left: 0px;
        }
        .yt-CroppedProfilePreview
        {
            float: left;
            margin-left:2px; margin-top:54px;
            position:relative;
            left:11px;
           
        }
        .yt-SampleProfileImage
        {
            float: left;
            width: 374px;
            height: 374px;
            margin-top: 0.5em;
            display: table; #position: relative; overflow: hidden
        }
        .yt-CenterImage
        {
        	#position: absolute; #top: 50%;display: table-cell; vertical-align: middle;
        }
        .yt-CenterSampleImg
        {
        	#position: relative; #top: -50%;
        }
        
        .yt-ProfileContainer
        {
            margin-left: 5px;
            padding: 0;
            width: 585px;
            height: 480px;
        }
    </style>
    <!--#include file="../analytics.asp"-->
</head>
<body>
    <form id="Form1" runat="server" action="">
    <div id="divShowModalPopup">
    </div>
    <div class="yt-ProfileContainer">
        <div class="yt-ProfileContentContainer">
            <div class="yt-Error" id="yt-CropperError">
                <div id="lblErrMsg" runat="server" visible="false">
                </div>
            </div>
            <div class="yt-ProfileContentPrimary">
                <div class="yt-Form">
                    <div class="yt-Form-Field">
                        <asp:Label ID="lblImageFile" runat="server" Text="Select an image to upload"></asp:Label>
                        <asp:FileUpload ID="ImageUploader" runat="server" />
                        <asp:LinkButton ID="lbtnUpload" runat="server" CssClass="yt-MiniButton yt-UploadPhotoButton"
                            Text="Upload Photo" OnClick="lbtnUpload_Click"></asp:LinkButton>
                    </div>
                    <asp:HiddenField ID="hdnX1" runat="server" />
                    <asp:HiddenField ID="hdnY1" runat="server" />
                    <asp:HiddenField ID="hdnX2" runat="server" />
                    <asp:HiddenField ID="hdnY2" runat="server" />
                    <asp:HiddenField ID="hdnWidth" runat="server" />
                    <asp:HiddenField ID="hdnHeight" runat="server" />
                    <div>
                        <div class="yt-SampleProfileImage">
             <div class="yt-CenterImage">
                <div class="yt-CenterSampleImg">
                            <asp:Image ID="img" runat="server" AlternateText="Upload Image" /></div></div></div>
                        <div class="yt-CroppedProfilePreview">
                            <h4>
                                <asp:Label ID="lblPreview" runat="server" Text="Preview:"></asp:Label></h4>
                            <div class="yt-Tribute-Photo">
                                <div id="previewWrap">
                                </div>
                                <span class="yt-PhotoFrame"></span>
                            </div>
                        </div>
                    </div>
                    <br style="clear: both;" />
                    <div style="width: 600px; margin-top: 20px;">
                        <div class="yt-Form-Cancel">
                            <a id="lbtnCancel" runat="server" href="javascript:void(0);" onclick="parent.ImageCroppermodalClose();">
                                Cancel</a>
                        </div>
                        <div class="yt-Form-Submit">
                            <asp:LinkButton ID="lbtnSave" runat="server" CssClass="yt-Button yt-ArrowButton"
                                OnClick="lbtnSave_Click"><span class="yt-ButtonLeftCap"></span>DONE<span class="yt-ButtonRightCap"></span></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
            <!--yt-ProfileContentPrimary-->
        </div>
        <!--yt-ProfileContentContainer-->
    </div>
    <!--yt-ProfileContainer-->
    </form>
    
    <!-- Included for Mobile Redirection functionality -- Detect Browser close and delete NoRedirection keyvalue from database -->
    <script type="text/javascript" src="../assets/scripts/BrowserOrTabCloseHandler.js"></script>

</body>
</html>
