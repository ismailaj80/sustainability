# 🛠️ دليل العمل الجماعي على GitHub - مشروع الاستدامة

هذا الملف يشرح للطلاب خطوات المشاركة في المشروع، وطريقة تنفيذ المهام بدون حدوث تعارضات.

---

## ✅ 1. كيف تنسخ المشروع وتبدأ العمل؟

قم بتشغيل الأوامر التالية (مرة واحدة فقط في البداية):

```bash
git clone https://github.com/ismailaj80/sustainability.git
cd sustainability
git checkout -b feature-اسمك-والمهمة

مثال للطالب حمزة:
git checkout -b feature-hamza-level2

مثال للطالب عمر:
git checkout -b feature-omar-tips


خطوات الرفع على github 
git add .
git commit -m "شرح ما تم تعديله"
git push origin feature-اسمك-والمهمة

مثال:
git commit -m "إضافة صفحة المستوى الثاني للفئة 7-14"
git push origin feature-hamza-level2

/****************************/
5. إرسال التعديل للمراجعة (Pull Request)
افتح المشروع من متصفحك على GitHub.

ستظهر لك رسالة:

Compare & pull request

اضغط عليها.

أضف وصفًا واضحًا لما قمت به.

اضغط:

Create pull request

بعدها سيقوم المشرف بمراجعة التعديل والموافقة عليه أو إعادته لك لتعديله.


6. تحديث مشروعك قبل بدء أي مهمة جديدة
إذا مر وقت على تحميل المشروع، تأكد أنك تملك آخر نسخة قبل العمل:


git checkout master
git pull origin master
git checkout feature-اسمك

✅ 1. عرض قائمة بجميع من ساهموا في المشروع:

git shortlog -sne


✅ 3. حفظ سجل التعديلات مع اسماء الاشخاص اللي عدلو على المشروع في ملف نصي:
git log --pretty=format:"%ad | %an | %s" --date=short > commit-log.txt

تجربة رفع الشغل من حساب الطالب
