# from django.http import Http404
# This is a shortcut for loading templates, filling contexts, and returning HttpResponse
from django.shortcuts import get_object_or_404, render
from django.http import HttpResponse
# from django.template import RequestContext, loader

from .models import Question

# Create your views here.
def index(request):
    # displays the last 5 polls in the system
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    context = { 'latest_question_list': latest_question_list}
    # output = ', '.join([p.question_text for p in latest_question_list])
    # return HttpResponse(output)
    # return HttpResponse(template.render(context))
    return render(request, 'polls/index.html', context)

def detail(request, question_id):
    # version 1
    # response = "You're looking at question %s."
    # return HttpResponse(response % question_id)
    # version 2
    # try:
    #     question = Question.objects.get(pk=question_id)
    # except Question.DoesNotExist:
    #     raise Http404("Question does not exist")
    # version 3
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'polls/detail.html', {'question': question})

def results(request, question_id):
    response = "You're looking at the results of question %s"
    return HttpResponse(response % question_id)

def vote(request, question_id):
    response = "You're voting on question %s."
    return HttpResponse(response % question_id)
