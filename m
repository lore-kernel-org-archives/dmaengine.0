Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200564;
	b=Z0I5YJigZeafqJnGce/o2fMk7/qhwHBkjdmAEl9Zf14ive0kgSWCDgPMp8R6omEYfBjR
	 Ogq3ZOuzxu7DWkwDVMYGiA1WY/YY8QcUtvecOfCdNeyV2E8Pux9U0JGWBNfE5wE2GGZbI
	 5vgEbKWUNf9PHQxOcjilDCP0xnLJPLBFbCGCUBIn0ddrLKaQrj4xMw/yvoezhrJpUlB4k
	 /6BuSHiAUwz8oEykXR7pR/9+yjXvis3bt3EhUo12NMMlSd/FmebfTeKMkZxAJjDucLjLQ
	 S4BR4M51OwulQkq/OmyuAOLwBXvezuOxgS3Apq2FurEyzUAngFCUN7H6R7i1EWhm7tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=HMYGVji39rvGpwUTzKWlZdi1xbpNuthDItoP5UGgcaA=;
	b=Lpl0xM7qbnyhUhZT8wYt8w/SdSbxAh03YIOjULOcH2UdB/q5v8YSJF4ki0ly8JA1ffLI
	 oZ4bgIKwJiOIWLJRGA6QWAqtrRaSoAmrSiIwvrnEq7FTfcTZ+3mtOqLiZ4Cp6Qmm/jCwo
	 qQid88yeAMM3Y0WticzO11WgNaWxv6tJukeNP5rQ5ULo2izVrX1jo10O4C2bMzwRHaMFc
	 TbocN2Lee8BiwmPLzX7liiONmDK6ErJbUehVz2i6bYvIeh8ui4n44rRIwncE6gDNbiKR5
	 rMnO95Uys0w7YKnGcGgNuqi1ICnoqCm8kXUR70BRuX/IjrdIzy5ljTOXbsoIWOrOkCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=divDtsBF;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3F1606A338
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 05:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F3F1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=divDtsBF
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-567cb8f983bso208978b6e.3
        for <dmaengine@vger.kernel.org>; Sun, 08 Nov 2026 21:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794200563; x=1794805363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMYGVji39rvGpwUTzKWlZdi1xbpNuthDItoP5UGgcaA=;
        b=divDtsBFxjKqkl9nF/I/bhDpIvPfTZ5U9B1J+E3fk7Mt8jF95qxY+ICc1yjqARCl54
         C6Jue4YCYHIP6bATImvTv9wiv7mPBc0xgrxd+2/mDXLecVGjN0D9+LQAwg2mQJDdlvKW
         KlChAU+ZKcbVkRW+uaknV66ff7No8KRbrc9Ep8uEf8k927fhdFa9+FIOHAC3hJl2Y0Ff
         L2Vla9SemlcwufoFoGhIpiXxNQmhBvw9K0I3vvORpXjs8tNqKR1infqjVzgRH1tAvNMx
         ssbPNejXK9GkPoZrlyWDg/IuoJa3XvqXiyikWqBZwLNSrlr8TpddOYcbBe9/2zz5gtD4
         /fYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794200563; x=1794805363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HMYGVji39rvGpwUTzKWlZdi1xbpNuthDItoP5UGgcaA=;
        b=Jw8LJBK5tMbfoVD+iuXFEcfFkt8rPZGV7KbLlMad1++hg3AV+kmPSyYJ4DQGtqk58B
         CFN1OlbK4CP8qkoZPZVD3IMgv8+qNNqW0YB29NSjDVCjH+zaPJ/I5Puyyibf6Hnt6YlU
         pepr/H5iX7ApYlwZ0F73/cRMOL4o1J6Kiz48503qtdLQ1UBd7ooTQF3kPGm/G0c6sP2A
         VqeMCKpjy5ZfUpMhFil40WEHFcGx+iLTSoxaIus3/Bab9tsAM2kYQX0nvgKDjOktxIhV
         bbQ8lyUz+HM4imHSh23fIixZgd2jiV7LkHNxkH3YjTsyvLeiC+QQ/CpUGendD4+dwUeh
         Be5A==
X-Gm-Message-State: APuU4Z/ijxA2N08yLNq2wErSucUuksT+HnLEMTzFZKUH6f1+KiEZbwPW
	fcLoeXfke3cu34i+1iu8N/mfQioro6Etrrqf6d4kaZXqwxygBVdk4Vug
X-Gm-Gg: AYBFou1U4IrAM9wRHyAvDiJ+vk8cPPzuFSG4iXWr+lIyB/WDXIh9rsSoWRxQm5Ztn2I
	Duwps3eMVCDcNJV6DA1i8FVrlGHWup3W38ikMjhO0XDoHDT99dzs34OuBllNteEUWuOQzjJZP3W
	qlGygITRafHgUdNWRnvDOUW83w3eFcPC97pwunNDgZZWPolfTaJREhewutnwv0woU4vdodWCpIs
	rKULQzhSzUs6xUoudYY2Df6OXZ1ziFZquoB1AaYl5rBkmog8yoil34uWuNCbCkRQD+i7CESl+Lr
	vnZgoMLMJ7tKhJnu1a5Bif/APJjRLDYphnxq2pw+Nu/N+vB2PcIks+lQRE+Gq4uplZfWyZpjybH
	APSDgPXKgCF1b+RPwQ/vSDzwx09tLYcDp7gePR5P1HzPyaZYHNGzXAEjrcIrct10XyH+7mEwjjx
	dHHpvnRrrjnJQlLbnA51C9iaTxMiyQTCJDdRzBy0mfHlEBonSXSME4V5DtdIxOZfXJ6/8v41GI5
	QWWtpJKLjRaV8akEAu2y2hX1RKMwUTP8yhMTdOFuxdUb7CiRsj2z9bvkkjOobQU/EZkcHC6VqEk
	Jsy1wiNEOIiS8z8KrwtcFotJaWLGyUILdAJPfQmQ+fDjcJAHiboQ13j3+eU6DxeEtn6mo/9GaIk
	9R+hy9sjndLo+Pm6YArNcpexCBOCOscRggeHeb6rrQMuvgA1tkMR7vXR0Pur+YkrfCif+X515eT
	zH2zZ/7xlNV4TtLkMQDSdg7jSNAN5z8OAhkJng/f5IDb2apyjpGzr6
X-Received: by 2002:a05:6808:4fc7:b0:4e8:e664:f268 with SMTP id 5614622812f47-568145f3e50mr2135301b6e.25.1794200563183;
        Sun, 08 Nov 2026 21:02:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac6352sm3570841b6e.1.2026.11.08.21.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:02:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 22:02:38 -0700
Subject: [PATCH 3/3] dmaengine: dw-axi-dmac: preserve suspension status
 until pause observes it
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
Message-Id: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-3-c48ec19e9ee4@gmail.com>
References: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com>
In-Reply-To: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

dma_chan_pause() clears SUSPENDED even when polling times out. Hardware
can set that status after the last poll, including during the final
delay, and the unconditional clear then discards an acknowledgment the
caller never observed. Another channel's interrupt can also consume the
status because the shared IRQ handler clears every channel's status
before taking its lock. Masking the suspend interrupt signal does not
prevent either path from clearing the status used by the polling code.

Leave SUSPENDED to the pause path and acknowledge it only after a
successful poll. A timed-out pause can then be retried without losing a
late acknowledgment. Mark the channel paused only after confirmation,
and let repeated pause calls succeed while it remains paused.

Clear the saved state and any old suspension status when enabling a
channel or completing termination, so a later transfer must obtain its
own acknowledgment. These state changes are serialized with pause by
the channel lock.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index de092f190528..33340f0e7462 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -226,6 +226,9 @@ static inline void axi_chan_enable(struct axi_dma_chan *chan)
 {
 	u64 val;
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->is_paused = false;
+
 	if (chan->chip->dw->hdata->nr_channels >= DMAC_CHAN_16) {
 		val = axi_dma_ioread64(chan->chip, DMAC_CHEN);
 		if (chan->id >= DMAC_CHAN_16) {
@@ -1161,6 +1164,8 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
 		chan = &dw->chan[i];
 		status = axi_chan_irq_read(chan);
+		/* Suspension status is consumed by dma_chan_pause(). */
+		status &= ~DWAXIDMAC_IRQ_SUSPENDED;
 		axi_chan_irq_clear(chan, status);
 
 		dev_vdbg(chip->dev, "%s %u IRQ status: 0x%08x\n",
@@ -1206,6 +1211,8 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 
 	vchan_get_all_descriptors(&chan->vc, &head);
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->is_paused = false;
 	chan->cyclic = false;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
@@ -1225,6 +1232,9 @@ static int dma_chan_pause(struct dma_chan *dchan)
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 
+	if (chan->is_paused)
+		goto out;
+
 	if (chan->chip->dw->hdata->nr_channels >= DMAC_CHAN_16) {
 		val = axi_dma_ioread64(chan->chip, DMAC_CHSUSPREG);
 		if (chan->id >= DMAC_CHAN_16) {
@@ -1258,10 +1268,12 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		udelay(2);
 	} while (--timeout);
 
-	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
-
-	chan->is_paused = true;
+	if (timeout) {
+		axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+		chan->is_paused = true;
+	}
 
+out:
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
 	return timeout ? 0 : -EAGAIN;

-- 
2.53.0

