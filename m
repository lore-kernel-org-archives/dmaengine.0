Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [12/18] fotg210-udc: remove a bogus dma_sync_single_for_device call
From: Felipe Balbi <balbi@kernel.org>
Message-Id: <87mun25u67.fsf@linux.intel.com>
Date: Mon, 11 Feb 2019 15:30:40 +0200
To: Christoph Hellwig <hch@lst.de>
Cc: John Crispin <john@phrozen.org>, Vinod Koul <vkoul@kernel.org>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Nicolas Ferre <nicolas.ferre@microchip.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org, iommu@lists.linux-foundation.org
List-ID: <dmaengine.vger.kernel.org>

SGksCgpDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JpdGVzOgo+IE9uIEZyaSwgRmVi
IDAxLCAyMDE5IGF0IDA1OjEwOjI2UE0gKzAxMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+
PiBPbiBGcmksIEZlYiAwMSwgMjAxOSBhdCAwMzoxOTo0MVBNICswMjAwLCBGZWxpcGUgQmFsYmkg
d3JvdGU6Cj4+ID4gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdyaXRlczoKPj4gPiAK
Pj4gPiA+IGRtYV9tYXBfc2luZ2xlIGFscmVhZHkgdHJhbnNmZXJzIG93bmVyc2hpcCB0byB0aGUg
ZGV2aWNlLgo+PiA+ID4KPj4gPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAbHN0LmRlPgo+PiA+IAo+PiA+IERvIHlvdSB3YW50IG1lIHRvIHRha2UgdGhlIFVTQiBiaXRz
IG9yIHdpbGwgeW91IHRha2UgdGhlIGVudGlyZSBzZXJpZXM/Cj4+ID4gSW4gY2FzZSB5b3UncmUg
dGFraW5nIHRoZSBlbnRpcmUgc2VyaWVzOgo+PiAKPj4gSWYgeW91IHdhbnQgdG8gdGFrZSB0aGUg
VVNCIGZlZWwgZnJlZS4gIEkganVzdCB3YW50IG1vc3Qgb2YgdGhpcyBpbgo+PiB0aGlzIG1lcmdl
IHdpbmRvdyBpZiBwb3NzaWJsZS4KPgo+IEkgZGlkbid0IHNlZSBpbiB0aGUgVVNCIHRyZWUgeWV0
LCBzbyBwbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IHdhbnQgdG8KPiB0YWtlIGl0LgoKc29ycnkg
Zm9yIHRoZSBkZWxheSwganVzdCB0b29rIGl0IHRvIG15IHRyZWUuCg==
