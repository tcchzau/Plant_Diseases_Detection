import router from '@ohos.router'
@Entry
@Component
struct Index {
  @State message: string = '库查视觉'

  build() {
    Column() {
      Row(){
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
        Blank()
        Image($r('app.media.icon'))
          .width('100%')
          .height('100%')
        }
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#ff92d6d6')
        .height('25%')
        .width('100%')
        .margin({bottom:10})

      Column({ space: 20 }){
        TextInput({ placeholder: '账号/手机号/邮件' })
          .height(50)
          .width('80%')

        TextInput({placeholder:'请输入密码'})
          .height(50)
          .width('80%')
          .type(InputType.Password)
        Button(){
          Text('登录')
            .fontColor('white')
            .fontWeight(FontWeight.Bold)
            .fontSize(25)
        }.width('80%').height(45)
        .onClick(()=>{
          router.pushUrl({url:"pages/home"})
        })
        Row({space:FlexAlign.SpaceAround}){
          Text('短信验证码登录')
            .fontWeight(FontWeight.Lighter)
            .fontColor('gray')
            .fontWeight(FontWeight.Bolder)
            .fontSize(15)
            .width('65%')

          Text('忘记密码')
            .fontWeight(FontWeight.Lighter)
            .fontColor('gray')
            .fontWeight(FontWeight.Bolder)
            .fontSize(15)
        }
        .justifyContent(FlexAlign.Center)
      }
      .margin({top:20})
      Column(){
        Text('没有账号？注册账号')
          .fontWeight(FontWeight.Lighter)
          .fontColor('gray')
          .fontWeight(FontWeight.Bolder)
          .fontSize(15)
          .onClick(()=>{
            router.pushUrl({url:'pages/SignIn'})
          })
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('30%')
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}