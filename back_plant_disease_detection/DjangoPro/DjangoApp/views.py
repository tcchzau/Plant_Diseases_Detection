#视图
from django.shortcuts import render
# Create your views here.S
"""
hello 为一个视图函数，每个视图函数必须第一个参数为request。哪怕用不到request。
request是django.http.HttpRequest的一个实例
"""
def hello(request):
    return HttpResponse("Hello World2222")
    
# Create your views here.S
def index(request):
	return render(request,"index.html")
