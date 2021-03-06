USE [TimelessTributePortal_New]
GO
/****** Object:  Table [dbo].[tblCOMMENTS_New]    Script Date: 07/04/2011 19:06:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCOMMENTS_New](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[UserName] [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserType] [smallint] NULL,
	[TypeCodeId] [int] NOT NULL,
	[CommentTypeId] [int] NOT NULL,
	[Message] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsPrivate] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblCOMMENTS_New] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Statistic [_dta_stat_1920218091_1_4_3_12_11]    Script Date: 07/04/2011 19:06:17 ******/
CREATE STATISTICS [_dta_stat_1920218091_1_4_3_12_11] ON [dbo].[tblCOMMENTS_New]([CommentId], [CommentTypeId], [TypeCodeId], [IsDeleted], [IsActive])
GO
/****** Object:  Statistic [_dta_stat_1920218091_12_4]    Script Date: 07/04/2011 19:06:17 ******/
CREATE STATISTICS [_dta_stat_1920218091_12_4] ON [dbo].[tblCOMMENTS_New]([IsDeleted], [CommentTypeId])
GO
/****** Object:  Statistic [_dta_stat_1920218091_2_4_11_12]    Script Date: 07/04/2011 19:06:17 ******/
CREATE STATISTICS [_dta_stat_1920218091_2_4_11_12] ON [dbo].[tblCOMMENTS_New]([UserId], [CommentTypeId], [IsActive], [IsDeleted])
GO
/****** Object:  Statistic [_dta_stat_1920218091_2_4_12_3_1]    Script Date: 07/04/2011 19:06:17 ******/
CREATE STATISTICS [_dta_stat_1920218091_2_4_12_3_1] ON [dbo].[tblCOMMENTS_New]([UserId], [CommentTypeId], [IsDeleted], [TypeCodeId], [CommentId])
GO
/****** Object:  Statistic [_dta_stat_1920218091_2_4_3_12]    Script Date: 07/04/2011 19:06:17 ******/
CREATE STATISTICS [_dta_stat_1920218091_2_4_3_12] ON [dbo].[tblCOMMENTS_New]([UserId], [CommentTypeId], [TypeCodeId], [IsDeleted])