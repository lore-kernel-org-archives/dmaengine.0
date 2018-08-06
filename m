Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,5/9] dmaengine: ste_dma40: use dmaenginem_async_device_register to simplify the code
From: Linus Walleij <linus.walleij@linaro.org>
Message-Id: <CACRpkdYhZ6WPwPPyZ13KFhcjbRArXsqxk4W-+e5CvpJ7gX7+uA@mail.gmail.com>
Date: Mon, 6 Aug 2018 12:34:02 +0200
To: sjhuang@iluvatar.ai
Cc: vkoul@kernel.org, Dan Williams <dan.j.williams@intel.com>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Patrice CHOTARD <patrice.chotard@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Eugeniy.Paltsev@synopsys.com, Colin King <colin.king@canonical.com>, dmaengine@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-ID: <dmaengine.vger.kernel.org>

T24gTW9uLCBBdWcgNiwgMjAxOCBhdCAxMDo1MyBBTSBIdWFuZyBTaGlqaWUgPHNqaHVhbmdAaWx1
dmF0YXIuYWk+IHdyb3RlOgoKPiBVc2UgZG1hZW5naW5lbV9hc3luY19kZXZpY2VfcmVnaXN0ZXIg
dG8gc2ltcGxpZnkgdGhlIGNvZGU6Cj4gICAgICAgICByZW1vdmUgZG1hX2FzeW5jX2RldmljZV91
bnJlZ2lzdGVyLgo+ICAgICAgICAgcmVtb3ZlIGxhYmVsIHVucmVnaXN0ZXJfc2xhdmUsIHVucmVn
aXN0ZXJfbWVtY3B5Cj4KPiBTaWduZWQtb2ZmLWJ5OiBIdWFuZyBTaGlqaWUgPHNqaHVhbmdAaWx1
dmF0YXIuYWk+CgpBY2tlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBs
aXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBkbWFlbmdpbmUiIGluCnRoZSBib2R5IG9m
IGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGlu
Zm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=
