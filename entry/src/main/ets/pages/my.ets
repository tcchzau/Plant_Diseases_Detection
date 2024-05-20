import router from '@ohos.router';
@Entry
@Component
struct my {
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
          Column().width('100%').height('100%')
        }
        .tabBar(this.TabBuilder('首页', 0, $r('app.media.home'),
          $r('app.media.home')))
        TabContent(){
          Column().width('100%').height('100%')
        }
        .tabBar(this.TabBuilder('记录',1,$r('app.media.log'),$r('app.media.log')))
        TabContent() {
          Column(){
            Row(){
                Text('库查视觉')
                  .fontSize(26)
                  .fontWeight(FontWeight.Bold)

            }
              .backgroundColor('#ff5ac6be').width('100%').height('6%').justifyContent(FlexAlign.Center)

            Row(){
              Text('个人中心   ')
                .fontColor('black')
                .fontWeight(FontWeight.Bold)
                .fontSize(20)
              Image($r('app.media.mine'))
                .height(20)
            }.width('100%').height('10%').justifyContent(FlexAlign.Center)
            Row().backgroundColor('#ff5ac6be').width('100%').height('10%')
            Row(){
              Image($r('app.media.mythree'))
                .height(25)
                .margin({left:20})
              Text('   用户名')
                .fontWeight(FontWeight.Bold)
                .fontSize(23)
            }
            .borderRadius(10)
            .backgroundColor('white')
            .width('90%')
            .height('8%')
            .margin({top:20})
            Row(){
              Image($r('app.media.code'))
                .height(25)
                .margin({left:20})
              Text('   修改密码')
                .fontWeight(FontWeight.Bold)
                .fontSize(23)
            }
            .borderRadius(10)
            .backgroundColor('white')
            .width('90%')
            .height('8%')
            .margin({top:20})
          }
          .width('100%').height('100%')
        }
        .tabBar(this.TabBuilder('我的', 2, $r('app.media.my'),
          $r('app.media.my')))
      }
      .barWidth('100%')
      .barHeight(50)
      .onChange((index: number) => {
        this.currentIndex = index;
      })
    }
    .width('100%')
    .height('100%')
  }
}