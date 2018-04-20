Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [4/8] sh_eth: Change platform check to CONFIG_ARCH_RENESAS
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <b0e4bb99-f964-cf8a-dddc-621f599d35f0@cogentembedded.com>
Date: Fri, 20 Apr 2018 18:22:03 +0300
To: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gMDQvMjAvMjAxOCAwNDoyOCBQTSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgoKPiBTaW5j
ZSBjb21taXQgOWI1YmEwZGY0ZWE0Zjk0MCAoIkFSTTogc2htb2JpbGU6IEludHJvZHVjZSBBUkNI
X1JFTkVTQVMiKQo+IGlzIENPTkZJR19BUkNIX1JFTkVTQVMgYSBtb3JlIGFwcHJvcHJpYXRlIHBs
YXRmb3JtIGNoZWNrIHRoYW4gdGhlIGxlZ2FjeQo+IENPTkZJR19BUkNIX1NITU9CSUxFLCBoZW5j
ZSB1c2UgdGhlIGZvcm1lci4KPiAKPiBSZW5lc2FzIFN1cGVySCBTSC1Nb2JpbGUgU29DcyBhcmUg
c3RpbGwgY292ZXJlZCBieSB0aGUgQ09ORklHX0NQVV9TSDQKPiBjaGVjay4KPiAKPiBUaGlzIHdp
bGwgYWxsb3cgdG8gZHJvcCBBUkNIX1NITU9CSUxFIG9uIEFSTSBhbmQgQVJNNjQgaW4gdGhlIG5l
YXIKPiBmdXR1cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dCtyZW5lc2FzQGdsaWRlci5iZT4KWy4uLl0KCkFja2VkLWJ5OiBTZXJnZWkgU2h0eWx5b3YgPHNl
cmdlaS5zaHR5bHlvdkBjb2dlbnRlbWJlZGRlZC5jb20+CgpNQlIsIFNlcmdlaQotLS0KVG8gdW5z
dWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGRtYWVu
Z2luZSIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5v
cmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRv
bW8taW5mby5odG1sCg==
