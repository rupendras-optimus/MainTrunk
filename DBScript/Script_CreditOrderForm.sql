set ANSI_NULLS ON
set QUOTED_IDENTIFIER OFF
GO

     
ALTER PROCEDURE [dbo].[usp_InsertCurrentCreditPoints]        
 @UserId  int,        
 @NetCreditPoints int,        
 @AmountPaid int,        
 @CreditPackageId int,        
 @PurchasedDate DateTime,        
 @IsDeleted bit,        
 @ModifiedDate DateTime,        
 @CouponId int,        
 @CreditCardId int,        
 @CreatedDate DateTime,        
 @ConfirmationNo varchar(20) 
       
AS        
BEGIN        
SET NOCOUNT ON;       
    
      
Declare @TransactionId int      
        
INSERT INTO [dbo].[CreditPointTransaction]        
(        
  UserId,        
  NetCreditPoints,         
  AmountPaid,         
  CreditPackageId,         
  PurchasedDate,         
  IsDeleted,        
  ModifiedDate,        
  CouponId,         
  CreditCardId,        
  CreatedDate,        
  ConfirmationNo   
        
)        
       VALUES        
(        
  @UserId,        
  @NetCreditPoints,         
  @AmountPaid,         
  @CreditPackageId,         
  @PurchasedDate,         
  @IsDeleted,        
  @ModifiedDate,        
  @CouponId,         
  @CreditCardId,        
  @CreatedDate,        
  @ConfirmationNo
      
)     
      
Select @TransactionId = @@IDENTITY       
Select @TransactionId  
End

GO

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[usp_InsertCreditPointTransDetails]
(
@UserId int,
@NetCreditPoints numeric,
@PurchasedDate datetime,
@CreditPackageId int,
@AmountPaid int ,
@CreatedDate Datetime,
@ModifiedDate datetime,
@CreditCardId int,
@IsDeleted bit,
@CouponId int,
@ConfirmationNo int

)
as



INSERT INTO [dbo].[CreditPointTransaction]
           (
UserId,
NetCreditPoints,
PurchasedDate,
CreditPackageId,
AmountPaid,
CreatedDate,
ModifiedDate,
CreditCardId,
IsDeleted,
CouponId,
ConfirmationNo

			
           )
     VALUES
(
@UserId,
@NetCreditPoints,
@PurchasedDate,
@CreditPackageId,
@AmountPaid,
@CreatedDate,
@ModifiedDate,
@CreditCardId,
@IsDeleted,
@CouponId,
@ConfirmationNo

)


