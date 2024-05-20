import router from '@ohos.router'
@Entry
@Component
struct SignIn {
  @State message: string = '库查视觉'

  build() {
    Column() {
      Row(){
        Image($r('app.media.plant'))
          .height(80)
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Green)
      }
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#ff92d6d6')
      .height('25%')
      .width('100%')
      .margin({bottom:10})
      Column({space:20}){
        TextInput({placeholder:'输入手机号/邮箱'})
          .type(InputType.Normal)
          .width('80%')
          .margin({
            bottom:5
          })
          .height(50)
        TextInput({placeholder:'请输入密码'})
          .type(InputType.Password)
          .width('80%')
          .height(50)
        TextInput({placeholder:'请确认密码'})
          .type(InputType.Password)
          .width('80%')
          .height(50)
      }
      .margin({
        top:20
      })
      Button(){
        Text('注册')
          .fontColor('white')
          .fontWeight(FontWeight.Bold)
          .fontSize(25)
      }.width('80%').height(45).margin({top:20})
      .onClick(()=>{
        router.pushUrl({url:"pages/home"})
      })
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}
