/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
ALTER TABLE [dbo].[LessonViews] DROP CONSTRAINT [FK_LessonViews_Lessons]
GO
ALTER TABLE [dbo].[LessonViews] DROP CONSTRAINT [FK_LessonViews_AspNetUsers]
GO
ALTER TABLE [dbo].[Lessons] DROP CONSTRAINT [FK_Lessons_Courses]
GO
ALTER TABLE [dbo].[CourseCompletions] DROP CONSTRAINT [FK_CourseCompletions_Courses]
GO
ALTER TABLE [dbo].[CourseCompletions] DROP CONSTRAINT [FK_CourseCompletions_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 10/24/2019 10:34:11 AM ******/
DROP TABLE [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 10/24/2019 10:34:11 AM ******/
DROP TABLE [dbo].[LessonViews]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 10/24/2019 10:34:11 AM ******/
DROP TABLE [dbo].[Lessons]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 10/24/2019 10:34:11 AM ******/
DROP TABLE [dbo].[Courses]
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 10/24/2019 10:34:11 AM ******/
DROP TABLE [dbo].[CourseCompletions]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/24/2019 10:34:11 AM ******/
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/24/2019 10:34:11 AM ******/
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/24/2019 10:34:11 AM ******/
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/24/2019 10:34:11 AM ******/
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/24/2019 10:34:11 AM ******/
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/24/2019 10:34:11 AM ******/
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/24/2019 10:34:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/24/2019 10:34:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/24/2019 10:34:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/24/2019 10:34:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/24/2019 10:34:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/24/2019 10:34:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 10/24/2019 10:34:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCompletions](
	[CourseCompletionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CourseID] [int] NOT NULL,
	[DateCompleted] [date] NOT NULL,
 CONSTRAINT [PK_CourseCompletions] PRIMARY KEY CLUSTERED 
(
	[CourseCompletionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 10/24/2019 10:34:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](200) NOT NULL,
	[Description] [varchar](500) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 10/24/2019 10:34:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessons](
	[LessonID] [int] IDENTITY(1,1) NOT NULL,
	[LessonTitle] [varchar](200) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Introduction] [varchar](300) NULL,
	[VideoURL] [varchar](250) NULL,
	[PdfFileName] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 10/24/2019 10:34:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonViews](
	[LessonViewID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[LessonID] [int] NOT NULL,
	[DateViewed] [date] NOT NULL,
 CONSTRAINT [PK_LessonViews] PRIMARY KEY CLUSTERED 
(
	[LessonViewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 10/24/2019 10:34:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201910141939146_InitialCreate', N'JobBoardLMS.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3BA117E2FD0FF20E8A92D72AC5CBA8B6D609F83AC939CA6CD0DEB64D1B7052DD18EB012A9235139098AF3CBFAD09FD4BFD0A144C9122FBAD88AED1C2CB0B0C8E137C3E1901C0E87F9DF7FFE3BFEE9250CAC671C273E2513FB6874685B98B8D4F3C97262A76CF1C327FBA71FFFF887F18517BE585F0BBA134E072D4932B19F188B4E1D27719F70889251E8BB314DE8828D5C1A3AC8A3CEF1E1E1DF9CA3230703840D589635FE9212E68738FB80CF29252E8E588A821BEAE12011E55033CB50AD5B14E224422E9ED8FFA0F3CF14C5DEF5CD6CF47835BAF93A1DE58D6CEB2CF0110834C3C1C2B61021942106E29E3E2678C6624A96B3080A50F0F01A61A05BA020C1A21BA72BF2AE3D3A3CE63D72560D0B28374D180D7B021E9D08153972F3B5146D972A04255E80B2D92BEF75A6C8897DE5E1ACE80B0D400132C3D3691073E2897D53B2384BA25BCC4645C3510E791903DCAF34FE3EAA221E589DDB1D9426753C3AE4FF0EAC691AB034C613825316A3E0C0BA4FE781EFFE13BF3ED0EF984C4E8EE68B934F1F3E22EFE4E35FF1C9876A4FA1AF40572B80A2FB98463806D9F0A2ECBF6D39F5768EDCB06C5669936B056C0966876DDDA0976B4C96EC09E6CDF127DBBAF45FB0579408E37A243E4C2668C4E2143E6FD32040F30097F54E234FFE7F03D7E30F1F07E17A8B9EFD6536F4127F983831CCAB2F38C86A93273FCAA7576DBCBF09B2CB9886FCBB6E5F79EDB7194D639777861A491E50BCC4AC2EDDD859196F2793E650C39B7581BAFFA6CD2555CD5B4BCA3BB4CE4C28586C7B3614F2BE2DDFCE1677164530789969718D34199C71CF1A492007964ABA32A4A3AE8644A083BFE775F122447E30C0C2D8810BB8260B3F0E71D9CBCF14CC1091DE32DFA3248175C1FB3B4A9E1A44879F03883EC36E1A83B9CE180AA337E776FF4409BE4DC3399F05DBE335D8D03CFC4A2F91CB687C4178AB8DF1AEA9FB9DA6EC8278E788E147E61680FCF3C10FBB030C22CE99EBE224B90463C6DE9482E75D005E117672DC1B8EAF53BB764CA601F243BD6722ADA8DF0AD29577A2A7503C140399CE4B6912F59A2E7DD24DD482D42C6A4ED12AAA20EB2B2A07EB26A9A0340B9A11B4CA99530DE6F7652334BCE397C1EEBFE7B7D9E66D5A0B2A6A9CC10A897FC604C7B08C79F788311C93D50874593776E12C64C3C799BEF9DE9471FA8A827468566BCD866C11187E3664B0FB3F1B3231A1F8D9F7B857D2E1385410037C277AFD49AB7DCE49926D7B3AD4BAB96DE6DB59034CD3E52C49A8EB67B340130813618CBAFCE0C359ED318DBC37725C043A0686EEF32D0F4AA06FB66C5477E41C079861EBCCCD03855394B8C853D5081DF27A0856ECA81AC156F191BA707F517882A5E3983742FC1094C04CF50953A7854F5C3F4241AB96A4961DB730DEF792875C738E234C38C3564D7461AE0F8770014A3ED2A0B46968EC542CAED9100D5EAB69CCDB5CD8D5B82B518AADD8648BEF6CB04BE1BFBD8961366B6C0BC6D9AC922E0218437BBB30507156E96A00F2C165DF0C543A31190C54B8545B31D0BAC67660A07595BC3B03CD8FA85DC75F3AAFEE9B79D60FCADBDFD61BD5B503DBACE963CF4C33F73DA10D83163856CDF37CCE2BF10BD31CCE404E713E4B84AB2B9B08079F61560FD9ACFC5DAD1FEA3483C846D404B832B416507129A8002913AA8770452CAF513AE145F4802DE26E8DB062ED97602B36A062572F472B84E62B54D9383B9D3ECA9E95D6A01879A7C34205476310F2E255EF7807A598E2B2AA62BAF8C27DBCE14AC7C4603428A8C5733528A9E8CCE05A2A4CB35D4B3A87AC8F4BB6919624F7C9A0A5A233836B49D868BB92344E410FB7602315D5B7F081265B11E928779BB26EECE4A953A260EC1872ACC637288A7CB2ACE45C89126B96275C4D7F98F54F410A730CC74D349948A5B425274663B4C4522DB006492FFD3861E788A139E2719EA9172A64DABDD5B0FC172CABDBA73A88C53E5050F3DF790BF3557E6DCB557D120175091D0DB9639345D33566A06F6EF1543814A05813C09FD2200D89D9CF32B7CEAFF1AAEDF3121561EC48F22B7E94A234C5DBAD8F40A7F151E7C6B063557A33EB8F9719C2A4F5C217ADEADDE49F9A518A705515C514C2DAD9F899DC9A75C64C761CFB0F592BC2DBCC3291AD520510453D312A090F0A58A5AE3B6A3D27A58A59AFE98E28259E5421A5AA1E5256D34B6A42562BD6C23368544FD19D839A505245576BBB236B524BAAD09AEA35B03532CB75DD5135D92755604D7577EC552A8ABC96EEF13E663CCE6CBA91E507DFCD763203C6DB2C8CC36C8495FBFD2A50A5B82796B8C157C044F95E1A95F1F4B7A951E5618FCD8CCA80615E876A17E4F565A8F156DF8C59BBF5AE2DF54DB7FE66BC7EA6FBA606A29C016592927B791694CE7C6371FE6A7F7CA31CC87212DB2AD408DBFC6BC27038E204A3D92FC134F0315FD40B821B44FC054E589EE9611F1F1E1D4B0F77F6E7118D93245EA039BF9A5ED2D4C76C0B495BE419C5EE138AD5148A0D1E9AAC4095E8F415F1F0CBC4FE77D6EA340B74F05F59F18175953C12FF97142A1EE2145BBFA929A1C324DE7778EA510AFADBBB7843D15DE557FFFA96373DB0EE62984EA7D6A1A4E87586BFFEB2A2973479D30DA459FBBDC5FB9D6DB5E70B5A5469B6ACFF5A61EEB3415E2A1452FE29442F7FEE2B9AF635C246889A170743E10DA242D38B8275B08CAF093CF864D96B827E9DD5BF2E584734E3CB029FF40793DF15745F868A963BDC8734E7A66D2C49999E5BF3B2374AD2DCF5DEA4A46F6F34D1D514ED1E7083A6616FE6A2BCB3F4E6C1B64E4DF6F260D8BBB4FB374F59DE972CE595D3BEDBE4E46DE62337DC32FDAED290F720714E9308B4FB64E36DDB9A2910BCE7199BFD528AF7CCD8C436BFFBC4E16D1B9B2940BCE7C6D62B3D78CF6C6D57FBE78E2DADF316BAF3645F356FC970A1A38B22B725F3E6217738FECF291841EE51E66F30F5D9634D99AF2D0C572466A6E6B43599B1327114BE0A4533DB7E7D151B7E6367054D335B43B267136FB1FE37F21634CDBC0D2994BB4843D62631EA52C35BD6B1A69CAAF794765CEB494B967B9BCFDA783BFF9EB28C07514A6DF6186E97DF4F52F1202A1972EAF44822562F8A61EFACFC2D47D8BF137FB982E07FD99160B7B66B96345764418BCD5B92A8209122343798210FB6D4B398F90BE432A8E601E8EC117916D4E3D72073EC5D91BB944529832EE3701ED4025EDC0968E29F654AD7651EDF45FC2B19A20B20A6CF03F777E473EA075E29F7A526266480E0DE8508F7F2B1643CECBB7C2D916E29E90824D4573A450F388C02004BEEC80C3DE3756403F3BBC64BE4BEAE22802690F681A8AB7D7CEEA3658CC24460ACDAC327D8B017BEFCF87FC62AD179D2540000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3ec6fd81-85c6-4e51-b75c-540a514d45f8', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'9ebf477c-1317-4fa1-8625-4133444ac6f6', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'c6c37517-b8e9-4a17-b8d4-a8bb0db84bb3', N'Manager')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4e2d30ca-11c5-4c46-bd53-cfdd603925ab', N'3ec6fd81-85c6-4e51-b75c-540a514d45f8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'02df681f-6f60-44b5-a131-015036af9b39', N'9ebf477c-1317-4fa1-8625-4133444ac6f6')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'55a16e01-72aa-4954-85f0-bb6fde787ec8', N'9ebf477c-1317-4fa1-8625-4133444ac6f6')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f169fb5b-7b22-44a7-bc34-dcd3cdcfb3c0', N'9ebf477c-1317-4fa1-8625-4133444ac6f6')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7f083001-b88d-4b47-ad5b-6476943a518c', N'c6c37517-b8e9-4a17-b8d4-a8bb0db84bb3')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'02df681f-6f60-44b5-a131-015036af9b39', N'dummy.pete@lms.com', 0, N'APqguc2MWYvhlk2OiayptBq/ghJeBe1kTN8TdwFMdaGP2lSPfbhwEQ9M7fUbA81a0A==', N'3ed2c96c-0cd6-41c1-9ff4-0df61e38fa29', NULL, 0, 0, NULL, 1, 0, N'dummy.pete@lms.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'10f0879e-4545-4ebc-a34f-80ac9e9cbccb', N'terry.pete@lms.com', 0, N'AOJnqXwLz8xhQ786/TyBzYHHx2im86ynh0bChwxtEjSMEt+13J2HVxCc0oV8DbI79w==', N'7485a4b3-fe8d-4e8d-8206-985023f9b2e3', NULL, 0, 0, NULL, 1, 0, N'terry.pete@lms.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4e2d30ca-11c5-4c46-bd53-cfdd603925ab', N'admin@lms.com', 0, N'ABkrNdEBD34XX0jogN4tp8o55I60k7bPZXWHvjDgotAtyeGWV/5vE57gzp5lu0rLeQ==', N'937b453e-d252-4ff7-a6df-86a1f2330067', NULL, 0, 0, NULL, 1, 0, N'admin@lms.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'55a16e01-72aa-4954-85f0-bb6fde787ec8', N'bear.pete@lms.com', 0, N'ADbMYdA0nH6fLKcZww8lndHS8gW55WLw2HaJ071OW1MC3MDGPcNDzfezkjeeOzCUCg==', N'a84ee3d2-823f-4d05-b86f-73c885ab0e05', NULL, 0, 0, NULL, 1, 0, N'bear.pete@lms.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7f083001-b88d-4b47-ad5b-6476943a518c', N'petree.pete@lms.com', 0, N'AByo/Yo7KsAfTMY11DeP75PeSNCZe1K/iRpaMdXw0bo2/DIbM5WNcSjaHtCR85VXKA==', N'72d03b41-6ec7-4ce9-a262-550d37645a3e', NULL, 0, 0, NULL, 1, 0, N'petree.pete@lms.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f169fb5b-7b22-44a7-bc34-dcd3cdcfb3c0', N'leeland.pete@lms.com', 0, N'AAjJiMPbIeXDfydc4khTJVTaLWGTV5OhMk2JDgci0XN+oS0wMFn8Sd5G4I5gw0lscg==', N'47bdc93c-23d4-4dd0-ae93-6d9579280e31', NULL, 0, 0, NULL, 1, 0, N'leeland.pete@lms.com')
SET IDENTITY_INSERT [dbo].[CourseCompletions] ON 

INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (37, N'02df681f-6f60-44b5-a131-015036af9b39', 1, CAST(N'2019-10-24' AS Date))
SET IDENTITY_INSERT [dbo].[CourseCompletions] OFF
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [IsActive]) VALUES (1, N'C#', N'The document provides a description of a training course on C# programming. C# is a modern, object-oriented programming language intended to create simple yet robust programs. Designed specifically to take advantage of CLI features, C# is the core language of the Microsoft .NET framework.', 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [IsActive]) VALUES (2, N'HTML', N'HyperText Markup Language, commonly abbreviated as HTML, is the standard markup language used to create web pages. Along with CSS, and JavaScript, HTML is a cornerstone technology used to create web pages as well as to create user interfaces for mobile and web applications.', 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [IsActive]) VALUES (3, N'CSS', N'Cascading Style Sheets (CSS) are the main coding files used to lay out a website and its design. CSS 3 is the latest in styling standards, and it brings several new properties and declarations you can use to make your website design more easily created.', 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [IsActive]) VALUES (4, N'JavaScript', N'JavaScript Specialist course focuses on the fundamental concepts of the JavaScript language. ... These include using control structures for program flow, manipulating the JavaScript DOM, using language objects, creating expressions, and creating and using custom objects.', 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [IsActive]) VALUES (5, N'MVC', N'MVC stands for Model, View and Controller. MVC separates application into three components - Model, View and Controller. Model: Model represents shape of the data and business logic. It maintains the data of the application. Model objects retrieve and store model state in a database', 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [IsActive]) VALUES (6, N'Python', N'Python is an interpreted, object-oriented, high-level programming language with dynamic semantics. ', 0)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [IsActive]) VALUES (7, N'KanBan', N'Kanban is a scheduling system for lean manufacturing and just-in-time manufacturing. Taiichi Ohno, an industrial engineer at Toyota, developed kanban to improve manufacturing efficiency. Kanban is one method to achieve JIT. The system takes its name from the cards that track production within a factory.', 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [IsActive]) VALUES (8, N'Project Management', N'Foundation of concepts and solutions that supports the planning, scheduling, controlling, resource allocation, and performance measurement activities required for successful completion of a project.', 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [IsActive]) VALUES (9, N'SQL', N' Structured Query Language, which is a computer language for storing, manipulating and retrieving data stored in a relational database. ... MS SQL Server using T-SQL, Oracle using PL/SQL, MS Access version of SQL is called JET SQL (native format) etc.', 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [IsActive]) VALUES (11, N'Customer Service', N'Ensuring customer''s requirements are met.', 1)
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (8, N'KanBan Fundamentals', 7, N'Welcome to KanBan Fundamentals', N'c_GQbg7___4', N'kanban.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (9, N'Project Management Basics', 8, N'Welcome to Project Management', N'HDXkITHLZSI', N'pm.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (12, N'HTML Fundamentals', 2, N'Welcome to HTML Fundamentals', N'UB1O30fR-EE', N'html.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (13, N'SQL Fundamentals', 9, N'Welcome to SQL Fundamentals', N'HXV3zeQKqGY', N't_sql.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (22, N'C# Fundamentals', 1, N'Welcome to C# Fundamentals', N'KdzSTm-62Ow', N'f9fe2757-eca1-464a-b17a-4665247bcdab.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (23, N'C# Loops', 1, N'Welcome to C# Loops', N'eIsGXwisKPE', N'bc158196-ac06-4dc5-a459-c373920eb416.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (24, N'C# Arrays', 1, N'Welcome to C# Arrays', N'BDfO1ryG6Rc', N'fa4d46eb-6d34-4726-90be-4f3fc9bc7709.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (25, N'SQL Select Statements', 9, N'Welcome to SQL Select Statements', N'D37_7p0-iKM', N'1a4d1ab8-0ede-4afa-8f98-b3271e19ca33.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (26, N'SQL Database Scripting', 9, N'Welcome to SQL Database Scripting', N'9Pzj7Aj25lw', N'113c87d0-31ba-4747-a73f-482aa313473f.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (27, N'HTML Tags', 2, N'Welcome to HTML Tags', N'FjvYEKUruts', N'a0a90ea8-1f71-411a-9bd4-13fd6f8d4f5e.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (28, N'HTML !DOCTYPE', 2, N'Welcome to HTML DOCTYPE', N'f1gTnOo7Hpc', N'htmldoctype.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (29, N'CSS Fundamentals', 3, N'Welcome to CSS Fundamentals', N'ieTHC78giGQ', N'f32781d7-5a99-46bd-9dac-42e5d2927bfe.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (30, N'CSS Animation', 3, N'Welcome to CSS Animation', N'zHUpx90NerM', N'ac91feb6-7c91-43ba-a206-bd273ad7d623.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (31, N'CSS Transitions', 3, N'Welcome to CSS Transition', N'TQLqn5jHIZQ', N'aca1462a-9ed0-4fbf-9504-7e44966c6914.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (32, N'JavaScript Fundamentals', 4, N'Welcome to JavaScript Fundamentals', N'pU722vRd66A', N'e4fe4d27-e2cc-46f5-ae62-60f37a68fd85.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (33, N'JavaScript Library', 4, N'Welcome to JavaScript Library', N'hMxGhHNOkCU', N'0cdd417e-d324-4ea2-aa63-86bc6dd600bd.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (34, N'JavaScript AJAX Crash Course', 4, N'Welcome to JavaScript AJAX Crash Course', N'82hnvUYY6QA', N'd85d6b47-e9ea-4805-81d5-e62da76eaf6f.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (35, N'MVC Fundamentals', 5, N'Welcome to MVC Fundamentals', N'vRqz_zUiJTw', N'5123c53c-6215-4363-82c6-8434431460d6.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (36, N'MVC Controllers', 5, N'Welcome to MVC Controllers', N'qXRcVhWxuaU', N'5d567a24-da01-4438-bda9-9e2458842a0c.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (37, N'MVC Models', 5, N'Introduction to MVC Models', N'zT_-KKlAoek', N'3f0397fb-a902-42d7-a571-7ae0eb433f3f.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (38, N'Kanban vs Scrum', 7, N'Welcome to Kanban vs. Scrum', N'GLFuzBiy18o', N'4e6dae31-4790-44cf-aa8f-9cb2f4c9fe8b.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (39, N'Kanban Boards', 7, N'Welcome to Kanban Boards', N'Bcid33tgq8A', N'747197c5-5b8d-48da-9d80-fa5bc19e4832.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (40, N'Customer Service', 11, N'Welcome to Customer Service', N'bL_D-qyva0c', N'fd23f6ea-7f61-4e7f-8429-b4ebf5a25586.pdf', 1)
SET IDENTITY_INSERT [dbo].[Lessons] OFF
SET IDENTITY_INSERT [dbo].[LessonViews] ON 

INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (78, N'02df681f-6f60-44b5-a131-015036af9b39', 24, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (79, N'02df681f-6f60-44b5-a131-015036af9b39', 22, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (80, N'02df681f-6f60-44b5-a131-015036af9b39', 23, CAST(N'2019-10-24' AS Date))
SET IDENTITY_INSERT [dbo].[LessonViews] OFF
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'02df681f-6f60-44b5-a131-015036af9b39', N'Dummy', N'Dummy')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'10f0879e-4545-4ebc-a34f-80ac9e9cbccb', N'Terry', N'Lesmeister')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'4e2d30ca-11c5-4c46-bd53-cfdd603925ab', N'Tasha', N'Lesmeister')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'55a16e01-72aa-4954-85f0-bb6fde787ec8', N'Bear', N'Lesmeister')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'7f083001-b88d-4b47-ad5b-6476943a518c', N'Petra', N'Lesmeister')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'f169fb5b-7b22-44a7-bc34-dcd3cdcfb3c0', N'Leeland', N'Feltenstein')
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CourseCompletions]  WITH CHECK ADD  CONSTRAINT [FK_CourseCompletions_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CourseCompletions] CHECK CONSTRAINT [FK_CourseCompletions_AspNetUsers]
GO
ALTER TABLE [dbo].[CourseCompletions]  WITH CHECK ADD  CONSTRAINT [FK_CourseCompletions_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[CourseCompletions] CHECK CONSTRAINT [FK_CourseCompletions_Courses]
GO
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_Courses]
GO
ALTER TABLE [dbo].[LessonViews]  WITH CHECK ADD  CONSTRAINT [FK_LessonViews_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[LessonViews] CHECK CONSTRAINT [FK_LessonViews_AspNetUsers]
GO
ALTER TABLE [dbo].[LessonViews]  WITH CHECK ADD  CONSTRAINT [FK_LessonViews_Lessons] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lessons] ([LessonID])
GO
ALTER TABLE [dbo].[LessonViews] CHECK CONSTRAINT [FK_LessonViews_Lessons]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
