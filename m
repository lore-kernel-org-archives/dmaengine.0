Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795395195;
	b=cF8WoIjbW5xOESrTSPQWjHk6gnXURK9+MsvPccFwkEJQ2dLJn+FbZlcFsBe1rj1Kzq8K
	 ppcAQ2kwV2UefuO1q1NX2Vj8n4RAivOgp+l2Ud7q/T0MDFmujb334jy2ERYu2v3QhNZ2F
	 FB0F/CTwOcnMf4j3Df447w2Z2HmSOToArF4RzlLx3aMpxOtu9wXd+6XsRKFOWCqqohhUL
	 M2qTok+pwcmaif2usPLKzT5S6KUXgN7Zh+vySYc2klAhY7Wa/EG/kl7a0JczGFCXvYbnV
	 05Ycn6TNIlEFHvW6h5r9GyTA01p0FO5lCfZLQ0QHQwv5dNWmlmM6TgisDLX7KZxd0tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395195;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=NIaNw3yNCHIlLX81dyeVjq4kOShFD20/PLGsWcpcsTg=;
	b=hcguRYyyOteQTO8uWR1MicWSt4i37RNdVvD72N9sjh/C7yHH3BoLMWEbKgzKNMAmxUHm
	 JT0vKBxs5GrDKUyNhe+PMAD5cfMpQs/0n0SqEfkgOAKdd9T+LhuSm0THT896XgyM7X2Uc
	 0KFfSnXvjEgFLNUTYjDUFbBeVpdA/saXqbEAnaoV9ys8lyjrCRtHmUSJthWsZ+b2s87Mk
	 C/y9l1G5MXlaSgN+e9ZL/qYQ3Trx1+usA2ClgCDfRrhfuYFl312roZ6ybuZ4KWZXijRNa
	 JRC8zAJpufGANxDrl6zZup2hRYXM5Ik8Jf6dWCsrFSue133sMcUDk84iynoez4v76tQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UXszFjlt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB48A606A31A;
	Mon, 23 Nov 2026 00:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UXszFjlt
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795395194;
	b=MYTn9vex2slDM8p8bvKAoAuviWOucCKu/fKw+O93Rege6vD08XJYEmZmCJRFNet6NQjl
	 9GpLvoSob4Z/cErz2jW/42pYVwziwklh+oVfPgvf4IyRhURWgKJ+yL4hAd43MQVAeZGsP
	 qbihfdl0x/XBzIew0QvF4ZIIjmV5UJiyNFO1u3+j59TgyiAvwo62P7KMM5DhOh1tCTbAo
	 9Cm72ZReKVStt5gMU9rOBYuwWEiAN0ugDhehGQu75wkHYBqCRsgwbXLbaTbIerz+LIIqQ
	 Jzpax8gi+Tw8AtTex2nrW6kLj+qOErVhFueAGxqJa3ot9NatkkQVrWf4sJKUBvD+ujg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795395194;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=NIaNw3yNCHIlLX81dyeVjq4kOShFD20/PLGsWcpcsTg=;
	b=IXGqoCVR52Zw9m0W1zjFyrhOSkfNnosBe4IIIqJNSuBzL33fddgbnOYxOntkHHq8XUyV
	 9s9RyE/bIWVD6vgm6Om22/wMN/0NJAIpueMhfUbXahIJVcmQcNrIo7Em8T/jHQDFgkBKE
	 clzgkwSrtNMQGF1V11fSa/DDNqcIa/gB/O23JlHvdIrRnny7IpdoXu0Lu6YA1mlIkGPWI
	 TIMwyPMdqTkq0aQyhFTJeAUD+/phr1ViIAcw+jwNRmvb1ELHSnwUTBe8LmvetilgXk5Es
	 NenB/rdXvSZr7Rdc9FG63hJt/OgbOwYjOQVCUFfaqyQTXStezcKYGvd4l0OEZJmKYUw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63DCA1F000C4;
	Mon, 23 Nov 2026 00:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795395194;
	bh=NIaNw3yNCHIlLX81dyeVjq4kOShFD20/PLGsWcpcsTg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=UXszFjltA6oudYfecCPMT54iQJ8mwR5xocYFe7FCiOJdYnY0bQ8cZ+LohgTFQbjeH
	 qvLGgfb+f+PXvL2pLdbTODe5QFaYxO673DpSVcA72+ITkQPjI6i9AUFoJ1KAY5j7d2
	 Bg/cEyGc1Td6tOcAdQabVn+DJv72daXIFOj0pBn4a3rS5TI0sp3c4Wh3uyYZ5jGInq
	 R92Bsg/2i48SPrryildxNXQUZO4SU1W2fY55kcHICxyEtVG82CudphFE3X//SS1e44
	 6OC+plx97TO06Zqp55LdM6Os127fZhrv4oo6vQFJ+ZM9t9wys5IPJNPvzS2DweAK3s
	 kTv0VQXVRSFrQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B9BF24430F;
	Mon, 23 Nov 2026 00:53:06 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Subject: [PATCH 0/2] dmaengine: Kill channel tasklets in remove again
Date: Mon, 23 Nov 2026 00:53:05 +0000
Message-Id: <20261123-dma-chancnt-v1-0-f0eea0a4bb63@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHGOA2sC/yXMywqAIBCF4VeJWSekUWCvEi28jDVBFloRhO+e1
 fLjcP4bIgbCCF1xQ8CTIq0+g5cFmEn5ERnZbBCVaDkXNbOLYu9i/M60cqbhUit0EvJjC+jo+mr
 98DseekazvwlI6QErOPqCbwAAAA==
X-Change-ID: 20261123-dma-chancnt-bafc519baef9
To: vkoul@kernel.org, ludovic.desroches@microchip.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank.Li@kernel.org, allen.lkml@gmail.com, dave.jiang@intel.com, 
 dmaengine@vger.kernel.org, andriy.shevchenko@linux.intel.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795395185; l=1164;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=qcysPc3/OLnwjWU/7y9whp4PW1EWxA7jm3IyIBShlQM=;
 b=viPMiyR1BGW2hFR4QUp6sDZ/oVlnod+EWT94IaiABkhtxXpqteeApyZoVak3J+Ov8XDOf1kbz
 G2cnvwMDLk7CRdM9H+PhM9ew+nOFCsTEO/4FGFuCy1NFNEgCPUTXfgz
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

at_xdmac and idma64 kill their channel tasklets in remove() with a loop
over dma.chancnt after dma_async_device_unregister(). Since commit
e81274cd6b52, dma_async_device_unregister() unregisters each channel
and decrements dma.chancnt for it, so chancnt is 0 when the loops run,
they do nothing, and a tasklet scheduled by an interrupt can run after
the devm-allocated driver data is gone. Both patches read the count
before unregistering.

These loops are also touched by Allen's "dmaengine: migrate channel
tasklets to WQ_BH" series (v4, 01/33 and 04/33), which keeps the
chancnt bound. The two fixes don't depend on that series; they make the
current tasklet cleanup work again. Whichever goes in second needs a
trivial rebase.

Found with a static analysis tool and checked by hand. Compile tested
on x86_64 with COMPILE_TEST (W=1); I don't have the hardware.

---
Suyuan Wang (2):
      dmaengine: at_xdmac: Kill the channel tasklets in remove again
      dmaengine: idma64: Kill the channel tasklets in remove again

 drivers/dma/at_xdmac.c | 4 +++-
 drivers/dma/idma64.c   | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)


