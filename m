Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [5/8] staging: emxx_udc: Change platform dependency to ARCH_RENESAS
From: Geert Uytterhoeven <geert+renesas@glider.be>
Message-Id: <1524230914-10175-6-git-send-email-geert+renesas@glider.be>
Date: Fri, 20 Apr 2018 15:28:31 +0200
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <dmaengine.vger.kernel.org>

RW1tYSBNb2JpbGUgaXMgYSBSZW5lc2FzIEFSTSBTb0MuICBTaW5jZSBjb21taXQgOWI1YmEwZGY0
ZWE0Zjk0MCAoIkFSTToKc2htb2JpbGU6IEludHJvZHVjZSBBUkNIX1JFTkVTQVMiKSBpcyBBUkNI
X1JFTkVTQVMgYSBtb3JlIGFwcHJvcHJpYXRlCnBsYXRmb3JtIGRlcGVuZGVuY3kgdGhhbiB0aGUg
bGVnYWN5IEFSQ0hfU0hNT0JJTEUsIGhlbmNlIHVzZSB0aGUKZm9ybWVyLgoKVGhpcyB3aWxsIGFs
bG93IHRvIGRyb3AgQVJDSF9TSE1PQklMRSBvbiBBUk0gaW4gdGhlIG5lYXIgZnV0dXJlLgoKU2ln
bmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4K
LS0tCiBkcml2ZXJzL3N0YWdpbmcvZW14eF91ZGMvS2NvbmZpZyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c3RhZ2luZy9lbXh4X3VkYy9LY29uZmlnIGIvZHJpdmVycy9zdGFnaW5nL2VteHhfdWRjL0tjb25m
aWcKaW5kZXggZDc1NzcwOTZmYjI1YWU3YS4uZTUwZTcyMjE4MzY0OGM1NSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9zdGFnaW5nL2VteHhfdWRjL0tjb25maWcKKysrIGIvZHJpdmVycy9zdGFnaW5nL2Vt
eHhfdWRjL0tjb25maWcKQEAgLTEsNiArMSw2IEBACiBjb25maWcgVVNCX0VNWFgKIAl0cmlzdGF0
ZSAiRU1YWCBVU0IgRnVuY3Rpb24gRGV2aWNlIENvbnRyb2xsZXIiCi0gCWRlcGVuZHMgb24gVVNC
X0dBREdFVCAmJiAoQVJDSF9TSE1PQklMRSB8fCAoQVJNICYmIENPTVBJTEVfVEVTVCkpCisJZGVw
ZW5kcyBvbiBVU0JfR0FER0VUICYmIChBUkNIX1JFTkVTQVMgfHwgKEFSTSAmJiBDT01QSUxFX1RF
U1QpKQogCWhlbHAKIAkgICBUaGUgRW1tYSBNb2JpbGUgc2VyaWVzIG9mIFNvQ3MgZnJvbSBSZW5l
c2FzIEVsZWN0cm9uaWNzIGFuZAogCSAgIGZvcm1lciBORUMgRWxlY3Ryb25pY3MgaW5jbHVkZSBV
U0IgRnVuY3Rpb24gaGFyZHdhcmUuCg==
