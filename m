Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [3/8,media] v4l: rcar_fdp1: Change platform dependency to ARCH_RENESAS
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-Id: <3039853.rivznOVBTv@avalon>
Date: Sat, 21 Apr 2018 11:07:11 +0300
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIEZyaWRheSwgMjAgQXByaWwg
MjAxOCAxNjoyODoyOSBFRVNUIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiBUaGUgUmVuZXNh
cyBGaW5lIERpc3BsYXkgUHJvY2Vzc29yIGRyaXZlciBpcyB1c2VkIG9uIFJlbmVzYXMgUi1DYXIg
U29Dcwo+IG9ubHkuICBTaW5jZSBjb21taXQgOWI1YmEwZGY0ZWE0Zjk0MCAoIkFSTTogc2htb2Jp
bGU6IEludHJvZHVjZQo+IEFSQ0hfUkVORVNBUyIpIGlzIEFSQ0hfUkVORVNBUyBhIG1vcmUgYXBw
cm9wcmlhdGUgcGxhdGZvcm0gZGVwZW5kZW5jeQo+IHRoYW4gdGhlIGxlZ2FjeSBBUkNIX1NITU9C
SUxFLCBoZW5jZSB1c2UgdGhlIGZvcm1lci4KPiAKPiBUaGlzIHdpbGwgYWxsb3cgdG8gZHJvcCBB
UkNIX1NITU9CSUxFIG9uIEFSTSBhbmQgQVJNNjQgaW4gdGhlIG5lYXIKPiBmdXR1cmUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5i
ZT4KCkFja2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+CgpIb3cgd291bGQgeW91IGxpa2UgdG8gZ2V0IHRoaXMgbWVyZ2VkID8KCj4gLS0t
Cj4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vS2NvbmZpZyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vS2NvbmZpZyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vS2NvbmZp
Zwo+IGluZGV4IGY5MjM1ZThmOGU5NjJkMmUuLjdhZDQ3MjVmOWQxZjk2MjcgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9LY29uZmlnCj4gQEAgLTM5Niw3ICszOTYsNyBAQCBjb25maWcgVklERU9fU0hfVkVV
Cj4gIGNvbmZpZyBWSURFT19SRU5FU0FTX0ZEUDEKPiAgCXRyaXN0YXRlICJSZW5lc2FzIEZpbmUg
RGlzcGxheSBQcm9jZXNzb3IiCj4gIAlkZXBlbmRzIG9uIFZJREVPX0RFViAmJiBWSURFT19WNEwy
ICYmIEhBU19ETUEKPiAtCWRlcGVuZHMgb24gQVJDSF9TSE1PQklMRSB8fCBDT01QSUxFX1RFU1QK
PiArCWRlcGVuZHMgb24gQVJDSF9SRU5FU0FTIHx8IENPTVBJTEVfVEVTVAo+ICAJZGVwZW5kcyBv
biAoIUFSQ0hfUkVORVNBUyAmJiAhVklERU9fUkVORVNBU19GQ1ApIHx8IFZJREVPX1JFTkVTQVNf
RkNQCj4gIAlzZWxlY3QgVklERU9CVUYyX0RNQV9DT05USUcKPiAgCXNlbGVjdCBWNEwyX01FTTJN
RU1fREVWCg==
