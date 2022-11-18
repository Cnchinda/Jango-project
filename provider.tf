
provider "aws" {
    region = "us-east-2"
    profile = {
        AWS_Access_Key_ID = ${{secrets.AWS_Access_Key_ID}}
        AWS_Secret_Access_Key = ${{secrets.AWS_SECRET_ACCESS_KEY}}
   }
  
}
