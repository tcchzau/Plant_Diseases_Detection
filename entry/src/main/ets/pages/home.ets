import router from '@ohos.router';
@Entry
@Component
struct home {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();
  @Builder TabBuilder(title: string, targetIndex: number, selectedImg: Resource,
                      normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }
  build() {
    Column(){
      Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
        TabContent() {
          Column(){
            Row(){
              Image($r('app.media.back'))
                .width(20)
                .height(20)
                .margin({right:110})

              Text('首页')
                .fontSize(30)
                  // .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)
            }.width('100%')
            .backgroundColor(Color.Red)

            // .justifyContent(FlexAlign.Start)
            Image($r('app.media.plant'))
              .width(300)
              .margin({
                top:20,
                bottom:20
              })
            Row(){
              Image($r('app.media.plant'))
                .width(10)
                .height(30)
                .align(Alignment.Start)

              Text('手动导入')
                .fontColor(Color.Blue)
                .fontWeight(FontWeight.Bold)
                .fontSize(20)
            }
            .width('100%')
            // .borderColor(Color.Red)
            // .borderWidth(10)
            // .margin({
            //   left:-150
            // })
            Image($r("app.media.camerala"))
              .width(150)
              .onClick(()=>{
                console.log('请拍摄')
              })

            Row(){
              Image($r('app.media.plant'))
                .width(10)
                .height(30)
                .align(Alignment.Start)

              Text('手动导入')
                .fontColor(Color.Blue)
                .fontWeight(FontWeight.Bold)
                .fontSize(20)
            }
            .width('100%')
            Image($r("app.media.addp"))
              .width(150)
              .onClick(()=>{
                console.log('请选择一张图片')
              })
          }

        }
        .tabBar(this.TabBuilder('首页',1,$r('app.media.home'),$r('app.media.home')))
        TabContent() {
          Column().width('100%').height('100%')
        }

        TabContent(){
          Column().width('100%').height('100%')
        }
        .tabBar(this.TabBuilder('记录',1,$r('app.media.log'),$r('app.media.log')))
        TabContent() {
          Column().width('100%').height('100%')
        }
        .tabBar(this.TabBuilder('我的', 2, $r('app.media.my'),
          $r('app.media.my')))
        .onClick(()=>{
          router.replaceUrl({url:"pages/my"})
        })
      }
      .barWidth('100%')
      .barHeight(50)
      .onChange((index: number) => {
        this.currentIndex = index;
      })
      // Button('界面1')
      //   .onClick(()=>{
      //     router.pushUrl({url:'pages/Tabs1'})
      //   })
    }
    .width('100%')
    .height('100%')

  }
}