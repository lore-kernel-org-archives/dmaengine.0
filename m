Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,11/14] dmaengine: pxa: document pxad_param
From: Robert Jarzmik <robert.jarzmik@free.fr>
Message-Id: <20180617170217.24177-12-robert.jarzmik@free.fr>
Date: Sun, 17 Jun 2018 19:02:14 +0200
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Nicolas Pitre <nico@fluxnic.net>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, alsa-devel@alsa-project.org
List-ID: <dmaengine.vger.kernel.org>

QWRkIHNvbWUgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIHB4YWRfcGFyYW0gc3RydWN0dXJlLCBhbmQg
ZGVzY3JpYmUgdGhlCmNvbnRyYWN0IGJlaGluZCB0aGUgbWluaW1hbCByZXF1aXJlZCBwcmlvcml0
eSBvZiBhIERNQSBjaGFubmVsLgoKU2lnbmVkLW9mZi1ieTogUm9iZXJ0IEphcnptaWsgPHJvYmVy
dC5qYXJ6bWlrQGZyZWUuZnI+CkFja2VkLWJ5OiBWaW5vZCBLb3VsIDx2a291bEBrZXJuZWwub3Jn
PgotLS0KU2luY2UgdjE6IGFkZGVkIFZpbm9kJ3MgYWNrCi0tLQogaW5jbHVkZS9saW51eC9kbWEv
cHhhLWRtYS5oIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS9weGEtZG1hLmggYi9pbmNsdWRlL2xpbnV4
L2RtYS9weGEtZG1hLmgKaW5kZXggZTU2ZWM3YWY0ZmQ3Li45ZmM1OTRmNjllZmYgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvbGludXgvZG1hL3B4YS1kbWEuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RtYS9w
eGEtZG1hLmgKQEAgLTksNiArOSwxNSBAQCBlbnVtIHB4YWRfY2hhbl9wcmlvIHsKIAlQWEFEX1BS
SU9fTE9XRVNULAogfTsKIAorLyoqCisgKiBzdHJ1Y3QgcHhhZF9wYXJhbSAtIGRtYSBjaGFubmVs
IHJlcXVlc3QgcGFyYW1ldGVycworICogQGRyY21yOiByZXF1ZXN0b3IgbGluZSBudW1iZXIKKyAq
IEBwcmlvOiBtaW5pbWFsIG1hbmRhdG9yeSBwcmlvcml0eSBvZiB0aGUgY2hhbm5lbAorICoKKyAq
IElmIGEgcmVxdWVzdGVkIGNoYW5uZWwgaXMgZ3JhbnRlZCwgaXRzIHByaW9yaXR5IHdpbGwgYmUg
YXQgbGVhc3QgQHByaW8sCisgKiBpZS4gaWYgUFhBRF9QUklPX0xPVyBpcyByZXF1aXJlZCwgdGhl
IHJlcXVlc3RlZCBjaGFubmVsIHdpbGwgYmUgZWl0aGVyCisgKiBQWEFEX1BSSU9fTE9XLCBQWEFE
X1BSSU9fTk9STUFMIG9yIFBYQURfUFJJT19ISUdIRVNULgorICovCiBzdHJ1Y3QgcHhhZF9wYXJh
bSB7CiAJdW5zaWduZWQgaW50IGRyY21yOwogCWVudW0gcHhhZF9jaGFuX3ByaW8gcHJpbzsK
