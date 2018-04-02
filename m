Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [11/15] dmaengine: pxa: document pxad_param
From: Robert Jarzmik <robert.jarzmik@free.fr>
Message-Id: <20180402142656.26815-12-robert.jarzmik@free.fr>
Date: Mon,  2 Apr 2018 16:26:52 +0200
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Nicolas Pitre <nico@fluxnic.net>, Samuel Ortiz <samuel@sortiz.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, alsa-devel@alsa-project.org
List-ID: <dmaengine.vger.kernel.org>

QWRkIHNvbWUgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIHB4YWRfcGFyYW0gc3RydWN0dXJlLCBhbmQg
ZGVzY3JpYmUgdGhlCmNvbnRyYWN0IGJlaGluZCB0aGUgbWluaW1hbCByZXF1aXJlZCBwcmlvcml0
eSBvZiBhIERNQSBjaGFubmVsLgoKU2lnbmVkLW9mZi1ieTogUm9iZXJ0IEphcnptaWsgPHJvYmVy
dC5qYXJ6bWlrQGZyZWUuZnI+Ci0tLQogaW5jbHVkZS9saW51eC9kbWEvcHhhLWRtYS5oIHwgOSAr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L2RtYS9weGEtZG1hLmggYi9pbmNsdWRlL2xpbnV4L2RtYS9weGEtZG1hLmgK
aW5kZXggZTU2ZWM3YWY0ZmQ3Li45ZmM1OTRmNjllZmYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGlu
dXgvZG1hL3B4YS1kbWEuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RtYS9weGEtZG1hLmgKQEAgLTks
NiArOSwxNSBAQCBlbnVtIHB4YWRfY2hhbl9wcmlvIHsKIAlQWEFEX1BSSU9fTE9XRVNULAogfTsK
IAorLyoqCisgKiBzdHJ1Y3QgcHhhZF9wYXJhbSAtIGRtYSBjaGFubmVsIHJlcXVlc3QgcGFyYW1l
dGVycworICogQGRyY21yOiByZXF1ZXN0b3IgbGluZSBudW1iZXIKKyAqIEBwcmlvOiBtaW5pbWFs
IG1hbmRhdG9yeSBwcmlvcml0eSBvZiB0aGUgY2hhbm5lbAorICoKKyAqIElmIGEgcmVxdWVzdGVk
IGNoYW5uZWwgaXMgZ3JhbnRlZCwgaXRzIHByaW9yaXR5IHdpbGwgYmUgYXQgbGVhc3QgQHByaW8s
CisgKiBpZS4gaWYgUFhBRF9QUklPX0xPVyBpcyByZXF1aXJlZCwgdGhlIHJlcXVlc3RlZCBjaGFu
bmVsIHdpbGwgYmUgZWl0aGVyCisgKiBQWEFEX1BSSU9fTE9XLCBQWEFEX1BSSU9fTk9STUFMIG9y
IFBYQURfUFJJT19ISUdIRVNULgorICovCiBzdHJ1Y3QgcHhhZF9wYXJhbSB7CiAJdW5zaWduZWQg
aW50IGRyY21yOwogCWVudW0gcHhhZF9jaGFuX3ByaW8gcHJpbzsK
