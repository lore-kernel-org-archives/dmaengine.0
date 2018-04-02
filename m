Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [05/15] mtd: nand: pxa3xx: remove the dmaengine compat need
From: Robert Jarzmik <robert.jarzmik@free.fr>
Message-Id: <20180402142656.26815-6-robert.jarzmik@free.fr>
Date: Mon,  2 Apr 2018 16:26:46 +0200
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Nicolas Pitre <nico@fluxnic.net>, Samuel Ortiz <samuel@sortiz.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, alsa-devel@alsa-project.org, Robert Jarzmik <robert.jarzmik@renault.com>
List-ID: <dmaengine.vger.kernel.org>

RnJvbTogUm9iZXJ0IEphcnptaWsgPHJvYmVydC5qYXJ6bWlrQHJlbmF1bHQuY29tPgoKQXMgdGhl
IHB4YSBhcmNoaXRlY3R1cmUgc3dpdGNoZWQgdG93YXJkcyB0aGUgZG1hZW5naW5lIHNsYXZlIG1h
cCwgdGhlCm9sZCBjb21wYXRpYmlsaXR5IG1lY2hhbmlzbSB0byBhY3F1aXJlIHRoZSBkbWEgcmVx
dWVzdG9yIGxpbmUgbnVtYmVyIGFuZApwcmlvcml0eSBhcmUgbm90IG5lZWRlZCBhbnltb3JlLgoK
VGhpcyBwYXRjaCBzaW1wbGlmaWVzIHRoZSBkbWEgcmVzb3VyY2UgYWNxdWlzaXRpb24sIHVzaW5n
IHRoZSBtb3JlCmdlbmVyaWMgZnVuY3Rpb24gZG1hX3JlcXVlc3Rfc2xhdmVfY2hhbm5lbCgpLgoK
U2lnbmVkLW9mZi1ieTogUm9iZXJ0IEphcnptaWsgPHJvYmVydC5qYXJ6bWlrQGZyZWUuZnI+Ci0t
LQogZHJpdmVycy9tdGQvbmFuZC9weGEzeHhfbmFuZC5jIHwgMTAgKy0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcHhhM3h4X25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcHhhM3h4X25h
bmQuYwppbmRleCBkMTk3OWM3ZGJlN2UuLjRhNTZhMGFlZjViMSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9weGEzeHhfbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcHhhM3h4X25h
bmQuYwpAQCAtMTUxOCw4ICsxNTE4LDYgQEAgc3RhdGljIGludCBweGEzeHhfbmFuZF9pbml0X2J1
ZmYoc3RydWN0IHB4YTN4eF9uYW5kX2luZm8gKmluZm8pCiB7CiAJc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldiA9IGluZm8tPnBkZXY7CiAJc3RydWN0IGRtYV9zbGF2ZV9jb25maWcJY29uZmln
OwotCWRtYV9jYXBfbWFza190IG1hc2s7Ci0Jc3RydWN0IHB4YWRfcGFyYW0gcGFyYW07CiAJaW50
IHJldDsKIAogCWluZm8tPmRhdGFfYnVmZiA9IGttYWxsb2MoaW5mby0+YnVmX3NpemUsIEdGUF9L
RVJORUwpOwpAQCAtMTUzMywxMyArMTUzMSw3IEBAIHN0YXRpYyBpbnQgcHhhM3h4X25hbmRfaW5p
dF9idWZmKHN0cnVjdCBweGEzeHhfbmFuZF9pbmZvICppbmZvKQogCQlyZXR1cm4gcmV0OwogCiAJ
c2dfaW5pdF9vbmUoJmluZm8tPnNnLCBpbmZvLT5kYXRhX2J1ZmYsIGluZm8tPmJ1Zl9zaXplKTsK
LQlkbWFfY2FwX3plcm8obWFzayk7Ci0JZG1hX2NhcF9zZXQoRE1BX1NMQVZFLCBtYXNrKTsKLQlw
YXJhbS5wcmlvID0gUFhBRF9QUklPX0xPV0VTVDsKLQlwYXJhbS5kcmNtciA9IGluZm8tPmRyY21y
X2RhdDsKLQlpbmZvLT5kbWFfY2hhbiA9IGRtYV9yZXF1ZXN0X3NsYXZlX2NoYW5uZWxfY29tcGF0
KG1hc2ssIHB4YWRfZmlsdGVyX2ZuLAotCQkJCQkJCSAgJnBhcmFtLCAmcGRldi0+ZGV2LAotCQkJ
CQkJCSAgImRhdGEiKTsKKwlpbmZvLT5kbWFfY2hhbiA9IGRtYV9yZXF1ZXN0X3NsYXZlX2NoYW5u
ZWwoJnBkZXYtPmRldiwgImRhdGEiKTsKIAlpZiAoIWluZm8tPmRtYV9jaGFuKSB7CiAJCWRldl9l
cnIoJnBkZXYtPmRldiwgInVuYWJsZSB0byByZXF1ZXN0IGRhdGEgZG1hIGNoYW5uZWxcbiIpOwog
CQlyZXR1cm4gLUVOT0RFVjsK
