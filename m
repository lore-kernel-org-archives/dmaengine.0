Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [4/8] sh_eth: Change platform check to CONFIG_ARCH_RENESAS
From: Geert Uytterhoeven <geert+renesas@glider.be>
Message-Id: <1524230914-10175-5-git-send-email-geert+renesas@glider.be>
Date: Fri, 20 Apr 2018 15:28:30 +0200
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <dmaengine.vger.kernel.org>

U2luY2UgY29tbWl0IDliNWJhMGRmNGVhNGY5NDAgKCJBUk06IHNobW9iaWxlOiBJbnRyb2R1Y2Ug
QVJDSF9SRU5FU0FTIikKaXMgQ09ORklHX0FSQ0hfUkVORVNBUyBhIG1vcmUgYXBwcm9wcmlhdGUg
cGxhdGZvcm0gY2hlY2sgdGhhbiB0aGUgbGVnYWN5CkNPTkZJR19BUkNIX1NITU9CSUxFLCBoZW5j
ZSB1c2UgdGhlIGZvcm1lci4KClJlbmVzYXMgU3VwZXJIIFNILU1vYmlsZSBTb0NzIGFyZSBzdGls
bCBjb3ZlcmVkIGJ5IHRoZSBDT05GSUdfQ1BVX1NINApjaGVjay4KClRoaXMgd2lsbCBhbGxvdyB0
byBkcm9wIEFSQ0hfU0hNT0JJTEUgb24gQVJNIGFuZCBBUk02NCBpbiB0aGUgbmVhcgpmdXR1cmUu
CgpTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVy
LmJlPgotLS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvc2hfZXRoLmggfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3NoX2V0aC5oIGIvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvcmVuZXNhcy9zaF9ldGguaAppbmRleCBhNWI3OTJjZTJhZTdkMDQ2Li4xYmY5MzBkNGEx
ZTUyYzE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3NoX2V0aC5o
CisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvc2hfZXRoLmgKQEAgLTE2Myw3ICsx
NjMsNyBAQCBlbnVtIHsKIH07CiAKIC8qIERyaXZlcidzIHBhcmFtZXRlcnMgKi8KLSNpZiBkZWZp
bmVkKENPTkZJR19DUFVfU0g0KSB8fCBkZWZpbmVkKENPTkZJR19BUkNIX1NITU9CSUxFKQorI2lm
IGRlZmluZWQoQ09ORklHX0NQVV9TSDQpIHx8IGRlZmluZWQoQ09ORklHX0FSQ0hfUkVORVNBUykK
ICNkZWZpbmUgU0hfRVRIX1JYX0FMSUdOCQkzMgogI2Vsc2UKICNkZWZpbmUgU0hfRVRIX1JYX0FM
SUdOCQkyCg==
