Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795081113;
	b=P41//kZTC4OWH+yRbpDK7aiyzE1+IJqKc2fGTc42jMuXEh+ekqwGI52cEFv2qVOPsxFo
	 Mtv75NDMIQLYHSXtMmdIqnm97Ja8vYFKE2N4Zc3/OZaS8groHvqONQLiWOVq4oIWAVtDz
	 Pr14sZIvrp8y64hH2uI9n12VWpBxUPn/af6s612EgWjw+2GJBUV1Nl4RoXE6iM9QvlHuX
	 c4F/M/ituiqv2WU28LGByUW9WjxOanNW4cV7C8t8h8ohwiFcY10IZk/sh5Kz/zzQg1hwn
	 zUgyQymdNm/ribXxdQO3PqgJjvytz/MtLb87ElcizxkkZhhShPmU1x9oLyifeqr8ZnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=s8nhpF/5t21tllE4kNr5hlFkBROVgPAv06E0/X8d27k=;
	b=KqSVVdSstP+jDAjryzbYyuSWnNEeMWYDYO9wTcaQmRkDszvdUQDWJq3ImJqwUmbP2Qhx
	 1HiVLtgVjUkV3W3k+k59UsGxsVc3K0vzl/U54PI9HaGRtAwEp1mBsyx2L1QPNcoB3VogL
	 J//zkRCm24GxYM9NcH2OCfzvrlIR2m7wx70u8/haj+6xnshjym/FxS/zCMxTw6kVUWxj+
	 uZN5lIzHSJUzIj51+y04xXfgh+gdUCkgBpBvYlYqukGpo3HM2TMMZhBVlAhzdcluss05s
	 5moCqNYB5Gsw/Qovr2yi9SJ01IB7MlvR6t6nEHu4HfT1SjU0UQpeXg0d1oOhLxVopnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RhUbtoZF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B60606A324
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 09:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4B60606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RhUbtoZF
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93f3c616c84so181284885a.1
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 01:38:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795081112; cv=none;
        d=google.com; s=arc-20260327;
        b=DZjzeWUqkzo3Qz0CqHu5g/1XFwZy0wC3Ous4R7TuaaBk4V7wdrkENQvOFCCz42iCiL
         c6Roxcc1j5Q4DkorIyR+5X3E5SBlKn0ApHHmZs5HSJBrmEWv4TJbnkU3zG9L11pboIze
         e0UXSZu45pM91qwTuQgCmmzdRcJpPikE4sFbAYNg+gqRuIOD5lY7WhLWb5kxcRfHNyoc
         2MPX801vuSnIfKVXho9zvz/t1Iw6wzsoswCLxLCOOok5tCQXK9WWZYK3m/MDp8hIp301
         N9IGUSObE2HKpcxLoKKFNPLFE2nKQ1NixNQjMhluKyZ2XFR/eZk/HRvf2DA25h2fDfS/
         IHFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s8nhpF/5t21tllE4kNr5hlFkBROVgPAv06E0/X8d27k=;
        fh=FjQqVEVrCXKecT47fa+6v/KsD/VHtC4DQApHFcVCBOM=;
        b=MLRoKLwhcEeA1G6WQHFSIhm4lElEAo24Prv1eHmWvWoSff+yCjjlVtn4hjg0vp6omN
         0j2zXGFuXbZiwzMsP2hn6XazHa16EJhRhwoJJUs+Czstsj+5p28RZuHPS/mRxKDGZUJ+
         nP5hsYhlSu+wEk32p5qCH80/uA13vLuLoypEJSJ8QkXsuisYsPBufOcT/oksdiXPBj2u
         y3iwYg2Th65KVsRWc6x5voNorMgTjMtVtyFCEvkfGvClAGxf/JmcgBj+7DcTPx/lHwKm
         ar3FNNWuZugo/zuKLSkzqytJu8BvurqDbb/mo9976u3acsNxfHGOpDcXsMV8JgZbb/I0
         34Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795081112; x=1795685912; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8nhpF/5t21tllE4kNr5hlFkBROVgPAv06E0/X8d27k=;
        b=RhUbtoZFnCx4f3nDvRvAhBnEbrdNbG6ReO09HJgNDE6J1s0dQDS6DmgGEthF0nnUDH
         +MT7B/6jWOHyCxuyVT5n5gthTGGacMJtr5xNy7n+9Pye2dSyDONfWAf7ocVDSRO9H0Ic
         0PqGWS1CP73icUv/g4sNSK61hip8/NkihkzcfSA52ycSvN/ZrZmefhubhbl7NXQqQE5z
         bwQEZcrlgFceL4vOAWmlXZBIgepATeGu18lDM7PdBr0ZB6NF4hCEHZLM2bIE0k3abtmp
         GAMm6a1SaUT/xMcIrmWo+B8ny+OMG6y788KBum85uAmlyFLf8gFrUFzkH8MICxvxHodm
         XsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081112; x=1795685912;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s8nhpF/5t21tllE4kNr5hlFkBROVgPAv06E0/X8d27k=;
        b=Ss6zVLB7T/sPl+7CkU9k/lpyq5teHx8ngA9GetpI6e1hgxPeIbDS7t6WgG4sSBi3X8
         shI75Dafd9Sb05yuQKTg5c7T/Sxg8P2HIYyd2NJcte1im2xmeUuZe6bOatsoVKfUZbBp
         G+8o+nUMu4Fi3JiqE3HZVxhdZs+zAqElVoY4V37IlSQ1o2ApFB/Dend6VkpwmCwqgOEM
         ExleHbHLFGYgR9Uw7CI/M6ut6eoX0k/mSfO2KaLjkmmFijdLGNpyZhEPQOIrKbnaz6Sv
         h1jwkhvUZjK2eGpVk9JD8g7r+d1bV7oeg+pnHW3KQ+TOvqxuSeECynx3OsVBQNG2uuqI
         6xrA==
X-Forwarded-Encrypted: i=1; AL+hErE0rvJJGng3VKmN+0cIjIc2uDmDpd4wMZ2NF6QmZOdLFNotyEGwvwkhKAj7RSCVLc2cJVMo0xQBm8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R3GF/wg0cW4VpBixscsjYgv3cIBBCO82j2kJVIkEHWtEAOd5U
	ssrJETxUUfcpydnDkWB/e99vOhJzbyZId6Xx8PzKgedsMLlsxtIXxE/4MVmzGw2E9pmqYpyVnxL
	CEmBsVHLvdohXP1rg6VyOgVkjPuJahVtAuQ==
X-Gm-Gg: AYBFou2/9Q6dYBzILTDhPpIe0mX18SXd0VHY5OYyDy9ikI4AsB6gpPZhIA750nr0Ujs
	zUhcVPddAAUeumpgU4Z076cDfHDXio6A8inzJNDkXodboPoIZ9P8//R1CTLdM+A3yNQ8qAh1SHK
	aXibBWo+1LUwKgxhhz0UuqcsrkIj1DW3GEiZ2MFS+pyZ4jnVUf5uZjVP5zMQOmvoYMU9G7M6XCI
	OvwukeOB5PIB1m9kjzSqQM9UsZXFKYYQoWZ9YsD8dvFtuREQtd1EyLwRAp/h6N3xJsW+yZz5H9r
	eX/ME68HJl6zVOgCo24n0fsR5gg1TDlIJ+kpTuKvmqLUfh7fhzVWDKaukCcEmwojnKgZ02Edd9f
	/QX4+etRt9b6HiPKiCvBBo2wVH4KJ4yqX73sUPVjc+6Ixk4zfhgyuoikXsGK62WJ87Qj7Ndo=
X-Received: by 2002:a05:620a:4809:b0:944:d79:c02 with SMTP id
 af79cd13be357-949994a8215mr964986285a.10.1795081111763; Thu, 19 Nov 2026
 01:38:31 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAAi4Z-d5eV8FM5sYJj1gqudWyioF++fG8P6uGX_LxbiKSXjekw@mail.gmail.com>
 <avyZM-6gM4amnQMT@lizhi-Precision-Tower-5810>
In-Reply-To: <avyZM-6gM4amnQMT@lizhi-Precision-Tower-5810>
From: Alex Guo <alexguo1023@gmail.com>
Date: Thu, 19 Nov 2026 17:38:20 +0800
X-Gm-Features: AclHuK9v7LJbhjVCrFOjeIf_qPnWAg5u9Sv5E5RixcPyL74qGSwBar9TYvQiOSA
Message-ID: <CAAi4Z-eE=16GBivyAz7=ucsD2eBxR3-qG2KebRvKGJUE=VkLHA@mail.gmail.com>
Subject: [PATCH v2] dmaengine: owl: Check IRQ lookup result
To: vkoul@kernel.org, afaerber@suse.de, mani@kernel.org
Cc: Frank.li@oss.nxp.com, Frank.Li@kernel.org, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

owl_dma_probe() passes the result of platform_get_irq() to
devm_request_irq() even when the lookup fails. The request can replace
the original error with -EINVAL.

Return the lookup error before requesting the DMA interrupt, so a
deferred probe can be retried.

Fixes: 47e20577c24d ("dmaengine: Add Actions Semi Owl family S900 DMA driver")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
Changes in v2:
- Drop the paragraph referring to the similar Tegra QSPI fix.
- Add Frank Li's Reviewed-by tag.

Build-tested the affected driver object with Clang 18 for arm64.
No hardware test was performed.

 drivers/dma/owl-dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
index 31a6c6e01a75..daea82718229 100644
--- a/drivers/dma/owl-dma.c
+++ b/drivers/dma/owl-dma.c
@@ -1156,6 +1156,9 @@ static int owl_dma_probe(struct platform_device *pdev)
         * simplification.
         */
        od->irq = platform_get_irq(pdev, 0);
+       if (od->irq < 0)
+               return od->irq;
+
        ret = devm_request_irq(&pdev->dev, od->irq, owl_dma_interrupt, 0,
                               dev_name(&pdev->dev), od);
        if (ret) {
--
2.43.0

On Tue, 17 Nov 2026 13:13:07 -0500, Frank Li <Frank.li@oss.nxp.com> wrote:
> On Sun, Nov 15, 2026 at 02:45:05PM +0800, Alex Guo wrote:
> > owl_dma_probe() passes the result of platform_get_irq() to
> > devm_request_irq() even when the lookup fails. The request can replace
> > the original error with -EINVAL.
> >
> > Return the lookup error before requesting the DMA interrupt, so a
> > deferred probe can be retried.
> >
> > A similar issue was fixed in commit 47c3e06ed95a
> > ("spi: tegra210-quad: Fix missing IRQ check in tegra_qspi_probe").
> >
>
> Drop this paragraph.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> > Fixes: 47e20577c24d ("dmaengine: Add Actions Semi Owl family S900 DMA driver")
> > Signed-off-by: Alex Guo <alexguo1023@gmail.com>
> > ---
> > Build-tested the affected driver object with Clang 18 for arm64.
> > No hardware test was performed.
> >
> >  drivers/dma/owl-dma.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
> > index 31a6c6e01a75..daea82718229 100644
> > --- a/drivers/dma/owl-dma.c
> > +++ b/drivers/dma/owl-dma.c
> > @@ -1156,6 +1156,9 @@ static int owl_dma_probe(struct platform_device *pdev)
> >          * simplification.
> >          */
> >         od->irq = platform_get_irq(pdev, 0);
> > +       if (od->irq < 0)
> > +               return od->irq;
> > +
> >         ret = devm_request_irq(&pdev->dev, od->irq, owl_dma_interrupt, 0,
> >                                dev_name(&pdev->dev), od);
> >         if (ret) {
> > --
> > 2.43.0
