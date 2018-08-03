Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [18/46] dmaengine: stm32-dma: use dmaenginem_async_device_register to simplify the code
From: Huang Shijie <sjhuang@iluvatar.ai>
Message-Id: <20180803072016.21544-19-sjhuang@iluvatar.ai>
Date: Fri,  3 Aug 2018 15:19:48 +0800
To: vkoul@kernel.org
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dave.jiang@intel.com, radhey.shyam.pandey@xilinx.com, appana.durga.rao@xilinx.com, jmkrzyszt@gmail.com, gomonovych@gmail.com, peter.ujfalusi@ti.com, keescook@chromium.org, horms+renesas@verge.net.au, geert+renesas@glider.be, shawnguo@kernel.org, baoyou.xie@linaro.org, michal.simek@xilinx.com, baohua@kernel.org, ludovic.desroches@microchip.com, linus.walleij@linaro.org, david.brown@linaro.org, Huang Shijie <sjhuang@iluvatar.ai>
List-ID: <dmaengine.vger.kernel.org>

VXNlIGRtYWVuZ2luZW1fYXN5bmNfZGV2aWNlX3JlZ2lzdGVyIHRvIHNpbXBsaWZ5IHRoZSBjb2Rl
OgoJcmVtb3ZlIGRtYV9hc3luY19kZXZpY2VfdW5yZWdpc3RlcgoKU2lnbmVkLW9mZi1ieTogSHVh
bmcgU2hpamllIDxzamh1YW5nQGlsdXZhdGFyLmFpPgotLS0KIGRyaXZlcnMvZG1hL3N0bTMyLWRt
YS5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS9zdG0zMi1kbWEuYyBiL2RyaXZlcnMvZG1hL3N0
bTMyLWRtYS5jCmluZGV4IDM3OWU4ZDUzNGU2MS4uNmJiYjNmYWI0ZjEzIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2RtYS9zdG0zMi1kbWEuYworKysgYi9kcml2ZXJzL2RtYS9zdG0zMi1kbWEuYwpAQCAt
MTI5NSw3ICsxMjk1LDcgQEAgc3RhdGljIGludCBzdG0zMl9kbWFfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAkJdmNoYW5faW5pdCgmY2hhbi0+dmNoYW4sIGRkKTsKIAl9CiAK
LQlyZXQgPSBkbWFfYXN5bmNfZGV2aWNlX3JlZ2lzdGVyKGRkKTsKKwlyZXQgPSBkbWFlbmdpbmVt
X2FzeW5jX2RldmljZV9yZWdpc3RlcihkZCk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIApA
QCAtMTMzNCw3ICsxMzM0LDYgQEAgc3RhdGljIGludCBzdG0zMl9kbWFfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gMDsKIAogZXJyX3VucmVnaXN0ZXI6Ci0JZG1h
X2FzeW5jX2RldmljZV91bnJlZ2lzdGVyKGRkKTsKIAogCXJldHVybiByZXQ7CiB9Cg==
