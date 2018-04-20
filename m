Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [3/8,media] v4l: rcar_fdp1: Change platform dependency to ARCH_RENESAS
From: Geert Uytterhoeven <geert+renesas@glider.be>
Message-Id: <1524230914-10175-4-git-send-email-geert+renesas@glider.be>
Date: Fri, 20 Apr 2018 15:28:29 +0200
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <dmaengine.vger.kernel.org>

VGhlIFJlbmVzYXMgRmluZSBEaXNwbGF5IFByb2Nlc3NvciBkcml2ZXIgaXMgdXNlZCBvbiBSZW5l
c2FzIFItQ2FyIFNvQ3MKb25seS4gIFNpbmNlIGNvbW1pdCA5YjViYTBkZjRlYTRmOTQwICgiQVJN
OiBzaG1vYmlsZTogSW50cm9kdWNlCkFSQ0hfUkVORVNBUyIpIGlzIEFSQ0hfUkVORVNBUyBhIG1v
cmUgYXBwcm9wcmlhdGUgcGxhdGZvcm0gZGVwZW5kZW5jeQp0aGFuIHRoZSBsZWdhY3kgQVJDSF9T
SE1PQklMRSwgaGVuY2UgdXNlIHRoZSBmb3JtZXIuCgpUaGlzIHdpbGwgYWxsb3cgdG8gZHJvcCBB
UkNIX1NITU9CSUxFIG9uIEFSTSBhbmQgQVJNNjQgaW4gdGhlIG5lYXIKZnV0dXJlLgoKU2lnbmVk
LW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KLS0t
CiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL0tjb25maWcgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL0tjb25maWcgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL0tjb25maWcKaW5kZXgg
ZjkyMzVlOGY4ZTk2MmQyZS4uN2FkNDcyNWY5ZDFmOTYyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9LY29uZmlnCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vS2NvbmZp
ZwpAQCAtMzk2LDcgKzM5Niw3IEBAIGNvbmZpZyBWSURFT19TSF9WRVUKIGNvbmZpZyBWSURFT19S
RU5FU0FTX0ZEUDEKIAl0cmlzdGF0ZSAiUmVuZXNhcyBGaW5lIERpc3BsYXkgUHJvY2Vzc29yIgog
CWRlcGVuZHMgb24gVklERU9fREVWICYmIFZJREVPX1Y0TDIgJiYgSEFTX0RNQQotCWRlcGVuZHMg
b24gQVJDSF9TSE1PQklMRSB8fCBDT01QSUxFX1RFU1QKKwlkZXBlbmRzIG9uIEFSQ0hfUkVORVNB
UyB8fCBDT01QSUxFX1RFU1QKIAlkZXBlbmRzIG9uICghQVJDSF9SRU5FU0FTICYmICFWSURFT19S
RU5FU0FTX0ZDUCkgfHwgVklERU9fUkVORVNBU19GQ1AKIAlzZWxlY3QgVklERU9CVUYyX0RNQV9D
T05USUcKIAlzZWxlY3QgVjRMMl9NRU0yTUVNX0RFVgo=
