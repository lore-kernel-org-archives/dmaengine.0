Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [07/15] net: smc91x: remove the dmaengine compat need
From: Robert Jarzmik <robert.jarzmik@free.fr>
Message-Id: <20180402142656.26815-8-robert.jarzmik@free.fr>
Date: Mon,  2 Apr 2018 16:26:48 +0200
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Nicolas Pitre <nico@fluxnic.net>, Samuel Ortiz <samuel@sortiz.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, Robert Jarzmik <robert.jarzmik@renault.com>, "yuval.shaia@oracle.com" <yuval.shaia@oracle.com>, Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, alsa-devel@alsa-project.org
List-ID: <dmaengine.vger.kernel.org>

RnJvbTogUm9iZXJ0IEphcnptaWsgPHJvYmVydC5qYXJ6bWlrQHJlbmF1bHQuY29tPgoKQXMgdGhl
IHB4YSBhcmNoaXRlY3R1cmUgc3dpdGNoZWQgdG93YXJkcyB0aGUgZG1hZW5naW5lIHNsYXZlIG1h
cCwgdGhlCm9sZCBjb21wYXRpYmlsaXR5IG1lY2hhbmlzbSB0byBhY3F1aXJlIHRoZSBkbWEgcmVx
dWVzdG9yIGxpbmUgbnVtYmVyIGFuZApwcmlvcml0eSBhcmUgbm90IG5lZWRlZCBhbnltb3JlLgoK
VGhpcyBwYXRjaCBzaW1wbGlmaWVzIHRoZSBkbWEgcmVzb3VyY2UgYWNxdWlzaXRpb24sIHVzaW5n
IHRoZSBtb3JlCmdlbmVyaWMgZnVuY3Rpb24gZG1hX3JlcXVlc3Rfc2xhdmVfY2hhbm5lbCgpLgoK
U2lnbmVkLW9mZi1ieTogUm9iZXJ0IEphcnptaWsgPHJvYmVydC5qYXJ6bWlrQGZyZWUuZnI+Ci0t
LQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc21zYy9zbWM5MXguYyB8IDEyICstLS0tLS0tLS0tLQog
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc21zYy9zbWM5MXguaCB8ICAxIC0KIDIgZmlsZXMgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3Ntc2Mvc21jOTF4LmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zbXNjL3Nt
YzkxeC5jCmluZGV4IDA4MDQyODc2Mjg1OC4uNGM2MDBmNDMwZjZkIDEwMDY0NAotLS0gYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zbXNjL3NtYzkxeC5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0
L3Ntc2Mvc21jOTF4LmMKQEAgLTIwMTgsMTggKzIwMTgsOCBAQCBzdGF0aWMgaW50IHNtY19wcm9i
ZShzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LCB2b2lkIF9faW9tZW0gKmlvYWRkciwKIAlscC0+Y2Zn
LmZsYWdzIHw9IFNNQzkxWF9VU0VfRE1BOwogIyAgZW5kaWYKIAlpZiAobHAtPmNmZy5mbGFncyAm
IFNNQzkxWF9VU0VfRE1BKSB7Ci0JCWRtYV9jYXBfbWFza190IG1hc2s7Ci0JCXN0cnVjdCBweGFk
X3BhcmFtIHBhcmFtOwotCi0JCWRtYV9jYXBfemVybyhtYXNrKTsKLQkJZG1hX2NhcF9zZXQoRE1B
X1NMQVZFLCBtYXNrKTsKLQkJcGFyYW0ucHJpbyA9IFBYQURfUFJJT19MT1dFU1Q7Ci0JCXBhcmFt
LmRyY21yID0gLTFVTDsKLQogCQlscC0+ZG1hX2NoYW4gPQotCQkJZG1hX3JlcXVlc3Rfc2xhdmVf
Y2hhbm5lbF9jb21wYXQobWFzaywgcHhhZF9maWx0ZXJfZm4sCi0JCQkJCQkJICZwYXJhbSwgJmRl
di0+ZGV2LAotCQkJCQkJCSAiZGF0YSIpOworCQkJZG1hX3JlcXVlc3Rfc2xhdmVfY2hhbm5lbChs
cC0+ZGV2aWNlLCAiZGF0YSIpOwogCX0KICNlbmRpZgogCmRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zbXNjL3NtYzkxeC5oIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc21zYy9zbWM5
MXguaAppbmRleCAwOGIxN2FkZjBhNjUuLmU4NDliNmMyZmE2MCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc21zYy9zbWM5MXguaAorKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
bXNjL3NtYzkxeC5oCkBAIC0zMjcsNyArMzI3LDYgQEAgc3RydWN0IHNtY19sb2NhbCB7CiAgKiBh
cyBSWCB3aGljaCBjYW4gb3ZlcnJ1biBtZW1vcnkgYW5kIGxvc2UgcGFja2V0cy4KICAqLwogI2lu
Y2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+Ci0jaW5jbHVkZSA8bGludXgvZG1hL3B4YS1kbWEu
aD4KIAogI2lmZGVmIFNNQ19pbnNsCiAjdW5kZWYgU01DX2luc2wK
