Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [17/46] dmaengine: stm32-mdma: use dmaenginem_async_device_register to simplify the code
From: Huang Shijie <sjhuang@iluvatar.ai>
Message-Id: <20180803072016.21544-18-sjhuang@iluvatar.ai>
Date: Fri,  3 Aug 2018 15:19:47 +0800
To: vkoul@kernel.org
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dave.jiang@intel.com, radhey.shyam.pandey@xilinx.com, appana.durga.rao@xilinx.com, jmkrzyszt@gmail.com, gomonovych@gmail.com, peter.ujfalusi@ti.com, keescook@chromium.org, horms+renesas@verge.net.au, geert+renesas@glider.be, shawnguo@kernel.org, baoyou.xie@linaro.org, michal.simek@xilinx.com, baohua@kernel.org, ludovic.desroches@microchip.com, linus.walleij@linaro.org, david.brown@linaro.org, Huang Shijie <sjhuang@iluvatar.ai>
List-ID: <dmaengine.vger.kernel.org>

VXNlIGRtYWVuZ2luZW1fYXN5bmNfZGV2aWNlX3JlZ2lzdGVyIHRvIHNpbXBsaWZ5IHRoZSBjb2Rl
OgoJcmVtb3ZlIGRtYV9hc3luY19kZXZpY2VfdW5yZWdpc3Rlci4KClNpZ25lZC1vZmYtYnk6IEh1
YW5nIFNoaWppZSA8c2podWFuZ0BpbHV2YXRhci5haT4KLS0tCiBkcml2ZXJzL2RtYS9zdG0zMi1t
ZG1hLmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS9zdG0zMi1tZG1hLmMgYi9kcml2ZXJzL2Rt
YS9zdG0zMi1tZG1hLmMKaW5kZXggMDZkZDE3MjUzNzVlLi4zOTBlNGNhZTBlMWEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZG1hL3N0bTMyLW1kbWEuYworKysgYi9kcml2ZXJzL2RtYS9zdG0zMi1tZG1h
LmMKQEAgLTE2NTYsNyArMTY1Niw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfbWRtYV9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gcmV0OwogCX0KIAotCXJldCA9IGRt
YV9hc3luY19kZXZpY2VfcmVnaXN0ZXIoZGQpOworCXJldCA9IGRtYWVuZ2luZW1fYXN5bmNfZGV2
aWNlX3JlZ2lzdGVyKGRkKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCkBAIC0xNjc0LDgg
KzE2NzQsNiBAQCBzdGF0aWMgaW50IHN0bTMyX21kbWFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKIAlyZXR1cm4gMDsKIAogZXJyX3VucmVnaXN0ZXI6Ci0JZG1hX2FzeW5jX2Rl
dmljZV91bnJlZ2lzdGVyKGRkKTsKLQogCXJldHVybiByZXQ7CiB9CiAK
