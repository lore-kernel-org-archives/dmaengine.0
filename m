Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895329;
	b=2XapkGDABsDnNSn+fWggrKUFB7cg7xXcpEKzJoK8yvkFo24BO3r9DyhCwujVdu6zoE43
	 4ALfn38qdJ5ImPsaLptlG5Zly0sTnsV5Zx+14FmPIuXIvgnBxrxUDXyVEbXpyUuXxmVXg
	 oinwS5YeFqPtx2jXElDkOxcOMhCi/NxnFtIxms3HrlmE9KzeM+lLv2NAKYLDPo+7+6jgl
	 O1fPD0IOBBLmyOcOT4EOLAGsv76aJ71xA8fsBZqmYFcBUTLWj/RrAKAy295hXpQ8GrMGU
	 68IMggS8avEw7M0DXf7LC0hmm3H2shjYN7ip9S/5AIWuKGvmhR45laCyPv0ouNmbVhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=kdFONMEpSsExQurD2X7JvvBNBeHJ+tNFPqAE2qVsxuQ=;
	b=bdDySxSmaMSiMBCXuQkTlfHj9qPhJAHwBBq+E2pltAGPqw3mkPfPtVfuxEGpH37PpRir
	 CMAm6ALEsD2JzxlA+yj6zBRTOS4yIt9VRZ9RSeMAjBXv2u1hZNqfzJGK9+7gNrAQrgi7/
	 xg0mJsbnxx6TteLJe2xkoS10086odb6cH9DOa9PPdxWmJZ4Hhyf89KXJKgHis/diOqK4r
	 A5Or5TaPpKaXjnzFJ2fdxHzeJpFBZs3B+SVPKsoXWJO7xvZqGeRel8gzNbVidknuoLfr6
	 NSA+fW4M8N0aaIT8+eFJmbJZEAa3TOx5JPUeeIWjWddi6kygliyHH8/KXF9ftDLyqYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AkVkSAZ/";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332AD606A31C
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 06:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 332AD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AkVkSAZ/
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so28788505e9.2
        for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 22:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895327; x=1795500127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kdFONMEpSsExQurD2X7JvvBNBeHJ+tNFPqAE2qVsxuQ=;
        b=AkVkSAZ/bgxnWLchZVPyXBpFJgxlQi9sUzpUlYuivxhV5ziy4YIrv6nW+++8p4n+Nu
         LCn+9ZIwNPFilulP6fwNKTgfi/q6ICDl7SjtuHRZ6NtOg/WuDT35TUuvYmnRgsXkyrqQ
         VJ/WvZ6dYo+y00kxF3Un4x2oTplio+MweQhyQpF6EyAfpRPI1Ppv09wOuwuCU8FVdUls
         XZZxwS/SnR9O953Gbtc7970rxdQjJi6CzPGQISxxugfi+PW/PVl3ypzDey1Qxqv1lHDN
         U5fn+34QKPvq9AtIm6DZhXtsGWoEb2xinLz9C6schyCuKSzJZaJ6fA3+qtMyUWSCbPfc
         p9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895327; x=1795500127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdFONMEpSsExQurD2X7JvvBNBeHJ+tNFPqAE2qVsxuQ=;
        b=CcxpQ7KiR5MwphDeBmDkMFBFnjuFJpstSZtxkLRn5eztR8VvX7ca4CjVp5xToiB8tN
         0L6P0tk/+BUCOnG+SCxOZMNMwcR1SjRwjzxEU9bjckhtDDqiTaZwbi7Y5ho5XWhq0s1d
         C2Wij1MXPaWGvVYknYizG2oUBMiHizPCbpRPE4PaiqDsNPFZUeHs7WjPIhE247MGYHRB
         RP8q8UtQK2LFS2fFBe9+R7H0F3uDpCyv1NUuBlPMOq05t6Yz2FMe9mgcJauVm1FdwLRp
         W0xE342xzjBAlwu+mgW+7y2HRE/c4l4gmuoK+cxp4VMs11X3YTHqHmgyFZ1TT74IK3Sr
         kUGw==
X-Gm-Message-State: APuU4Z9xFR8I/85d6heaw12lN++9lw8rFoCsEHIkueNEILeiBnIHs9Hu
	aT7IW5a6pJ7cMb1Vt18mnS+gf3IFl/h3lvpPuEXI9dGHTRBZ0AjOMqby7LfiAtaG
X-Gm-Gg: AYBFou3nSWoyppASPAPo2CbD/Q6ChbYTdgP8TsX11N/wAmGrP0bX8Eb7FXc8drtyDec
	0X/fIIYy0gvPjPzPPcb8RUX7AV+3QA+Q4bPiMHhZ9McINNjuPdlr288NEG+EdA3i/j9/uzY7GO9
	HU+nFIN3gFZYPaAYXhJJGMUwVhpaiaDrmXH6sI7pAoq96LXFut1CtBBAXTNl2XDftC6AEc5ga2I
	QhMlMBVqqBnyEm59cIYxKZxZvu4Sck23ubL9aaFR24e3zE9tMwP21jCiuMdjISIjLPzi4f5iPu7
	fpkEudGYVaiwyeWxIgzpVva4YGvHBzeQXJg5u872V3Rb5NpIZfm/dhtIriaXe95Jsem+oIhG9XF
	nap5WFChGitUW+zy/CZ9JjpnqRVq3d4ZBF8tGpqQaVd+vMTgAWQ1x5gtamyILgovXO/XUjzeK+5
	9cnF1hDomcP/8M5x5KCHMbOHvTEpY+70tiG7XeLoqRDFI6sWiehBRBIvFd+TNDAuxM1WjF14z1l
	sGiCPKcgUlG0xnaGMVgYbL71W6n9yKGeZ7yG/iwyIlbZ8NRsTDO/NjGZjsYq7GF+EUBZqgaQWrj
	MvQvVBMkQVE37GVDyE+fC8ehpJcd+uCK0DuQHM17aHmtmwFRIkHBxb31BXzwZlXhBg==
X-Received: by 2002:a05:600c:3509:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb559f2cc3mr258857695e9.2.1794895327227;
        Mon, 16 Nov 2026 22:02:07 -0800 (PST)
Received: from localhost.localdomain ([46.188.59.33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a33c344a58sm3455470f8f.34.2026.11.16.22.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:02:06 -0800 (PST)
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: dmaengine@vger.kernel.org
Cc: lars@metafoo.de,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Matsievskiy <matsievskiysv@gmail.com>
Subject: [PATCH] dmaengine: axi-dmac: change IRQ to threaded mode
Date: Tue, 17 Nov 2026 09:01:24 +0300
Message-ID: <20261117060124.27914-1-matsievskiysv@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Threaded IRQ handlers run in a less critical context compared to normal
IRQs, so they can perform more complex and time-consuming operations
without causing significant delays in other parts of the kernel.
Additionally, regmap-irqchip requires child devices to handle IRQs in
threaded mode.

In this patch change IRQ to threaded mode for compatibility with
regmap-irqchip.
Switch spin_lock() to spin_lock_irqsave() in IRQ handler as it may be
interrupted in threaded mode. spin_lock_irqsave() prevents recursive
spinlock deadlock.

Signed-off-by: Sergey Matsievskiy <matsievskiysv@gmail.com>
---
 drivers/dma/dma-axi-dmac.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index 98aaccd26a26..4a340e382e44 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -583,6 +583,7 @@ static irqreturn_t axi_dmac_interrupt_handler(int irq, void *devid)
 {
 	struct axi_dmac *dmac = devid;
 	unsigned int pending;
+	unsigned long flags;
 	bool start_next = false;
 
 	pending = axi_dmac_read(dmac, AXI_DMAC_REG_IRQ_PENDING);
@@ -591,7 +592,7 @@ static irqreturn_t axi_dmac_interrupt_handler(int irq, void *devid)
 
 	axi_dmac_write(dmac, AXI_DMAC_REG_IRQ_PENDING, pending);
 
-	spin_lock(&dmac->chan.vchan.lock);
+	spin_lock_irqsave(&dmac->chan.vchan.lock, flags);
 	/* One or more transfers have finished */
 	if (pending & AXI_DMAC_IRQ_EOT) {
 		unsigned int completed;
@@ -602,7 +603,7 @@ static irqreturn_t axi_dmac_interrupt_handler(int irq, void *devid)
 	/* Space has become available in the descriptor queue */
 	if ((pending & AXI_DMAC_IRQ_SOT) || start_next)
 		axi_dmac_start_transfer(&dmac->chan);
-	spin_unlock(&dmac->chan.vchan.lock);
+	spin_unlock_irqrestore(&dmac->chan.vchan.lock, flags);
 
 	return IRQ_HANDLED;
 }
@@ -1324,8 +1325,10 @@ static int axi_dmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_request_irq(&pdev->dev, dmac->irq, axi_dmac_interrupt_handler,
-			       IRQF_SHARED, dev_name(&pdev->dev), dmac);
+	ret = devm_request_threaded_irq(&pdev->dev, dmac->irq, NULL,
+					axi_dmac_interrupt_handler,
+					IRQF_SHARED | IRQF_ONESHOT,
+					dev_name(&pdev->dev), dmac);
 	if (ret)
 		return ret;
 
-- 
2.47.3

