Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200562;
	b=TF2g30KEe2+JhBo5xLwZ4C/XC/g8SbCd7RoodkhFD/0v1yHP7Ff4jtoLdGsloYWYdZWD
	 pi+QqmWcDf6zRGb3PWjfAAl1iFv3vWo60jZBq7z5ozi7c/4M6s10XPZuq5sFXfPQb8alg
	 saDN2SjBIpn6vNQOlTKYqdI4WAcfcMFLWK3dlSjqV+5uQI4zkU7v+aUIVpuT9Iy7kXUhB
	 xpLi22KdTZJQhzmsLmOGn91KXnXkqkWg5el5SIk5ZSsVkDXLIRs3RHXLi4VL/9mEu4awQ
	 vUl41shLrWTocFkdi5gsOacXrdnzNKCmyY930VN6S21utmmE2MY5EjNJobqw2dH7coQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=fmZWmm/0VCdmfPHxX0/wFVft9JJWsuY41pTezuz/3H4=;
	b=FU7oRlbyMPXJWndfiNahLruDAkNX7aJXSlyzbgmn2Vsm2FCjpoCn4oc7XoHw/PahC/+U
	 HgaT4M/frTXBcqNNP3209wDW5mQpEzoBmxb7S2/ywMpMy6wFgMqnAUr8X8pAQy9djhJA4
	 PaGH09bbj3rfP5wUyyTnvX/E/06Dxbi8LE9Kr/KuDVivKRSA7UV++MV884i1PsACNOTF7
	 ORf+1BFkmw2skySwXoBoHuK1T+tlIRDAKpVzk7BD1AAiHeia5kWkHR8Tu2Nq78TwpOitE
	 4v/yfOfpxKM1vut8CKD2UPjtY46GF8JekDRvDHOoZlK2usb19j9VyDowTs5EG+DujKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rf0V5p0x;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CA6606A336
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 05:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1CA6606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rf0V5p0x
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-70059e4dab6so254003eaf.3
        for <dmaengine@vger.kernel.org>; Sun, 08 Nov 2026 21:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794200561; x=1794805361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmZWmm/0VCdmfPHxX0/wFVft9JJWsuY41pTezuz/3H4=;
        b=rf0V5p0xsdWdI/wOsBFvhtUY9s0uFE3whuPcHt8ilVnsyYKdD0bIjW/L4vb+DJ2bJ2
         krE4tztoopmqnDakpTWCiG9NHV2IG3Wngxz8sY2l+Ny8wHTgtMWQcjnc1YRnWCCDizyU
         y19eh8I93hr27leJlF4TvVWNhUIxxGWEcECp2EVpj4dUHu23rxAzAJYXM2bex7rFjrbO
         O3sH0NykuccDWyNUT69XVewENnC8G1sDIktCPRXtnMBiyGHCZumvGJxNtR4aPbITi9nh
         TtUZckqStcHNHJxitiftzGF/UwkwKzHKDF1De88CT+IlnxPMzSvU0KJSza0OcD6lSV8P
         /uwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794200561; x=1794805361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmZWmm/0VCdmfPHxX0/wFVft9JJWsuY41pTezuz/3H4=;
        b=Ywi3iu/9OC5ouvRiGqqBnN5+8WATNMDAi+jXkdzpu+iOJR7HjV4TWSZoSU+jGP8NOn
         4ZMJGHh2XvEbJmYBx17pBbrlUsNarso+XbHIFmyVoTOHS6ClOaOOjF+Kur6st0OkEM/2
         559f3bYYCC/NBwh76RFdr4fTepUFT/YaIGaIxS17w3ZN4P9Vh2BfyJiLB0Rer0w5z1Vq
         r1D5oUWw0nGJWhEb+1n5PWImO3vaY/qpJJaIvnj89615CzCKF4fIoDQbqvum1vdVC5+q
         jRR6Q6FrP2oFfy6tr8COUude0ngIqZaQzfcQ+1H+rGM3ehmpZQd0H+I3MDjFXbaU9vdj
         CMNw==
X-Gm-Message-State: APuU4Z/vnGTIS3up5sDMEPQMaMh4B+EK+K7Pvu7uGMOiC4Dsc3wr1MGN
	dSuYlPmuB4lbFsLFPY5w8th4yMByvUu1t08ivzhiWjop2aKPkTnJ/Qv5
X-Gm-Gg: AYBFou0uNrLzAho+NLyhWSkdqzLQl9BfNH+wBSeRpqFy6oFeAPiOIy4q2qMSPN9LSxr
	q5ELjShcQwJVWNV5sRKCNVpKP/IeH0C5owgajX9b3qSgcOlFVN9ZcgC+pPKmc9f2aIQ7q04A1la
	2lcOcggwUHRgBrq9Pp+4fgeYu7ov6JtaGknCAZSn8a/MzKZERV/3rVOZHqYWWvY91IkVoe/8MFu
	OTJvW6VT3Ppg18KZ5z6Ioym6elQZM5RV7ohaXmTFmzojAkI6jNaJrW5/IDR5LErzzMtYMDtg5a+
	eJpPYv8QImZcrW07iMwd7nQiaQCe9PJzpVaHMACbEOXe6iwfRzpb3Axed9MNU3LATcL4vz3+tG/
	5GJ1V6yt/DTciiwC0imYJOuRgekXZeXa3u+JMP2e8LR0o+okjHG7kKkppQiRTWRYdtRo4SBQKgy
	91izpumXwtBpxB08HiIoFBF8FI6zeJqoYOQNnGQ12YyVT5GByq5ujJ27N5ZW/MR83Z7YLEeCHri
	9OBm6Ds7iPw0B0wPEntAdUH4AsqYma6pT6XmWr5ryIQdbVTIpGHrXR+96dWSXO0EhWrArfq38SP
	rH/bPQOTsF8+pSDIrUBPEqMF7WgzzGbRGpL8Bie5qqyKOk/supYlCUhd2vcNz8ACTHipjQx2tpD
	U3wBjVKfWYbPdeW4hf3SNpe+IAopv9CGgP+GQcGdm5wlLsyNSVStFNoHTbKjdVhZ3xXfrIRZM8a
	hNsquJKa6CfsICAw1Jp66Xdhx+0LLDZr52aR46M4K2mCisHY2atYp7
X-Received: by 2002:a05:6808:f14:b0:4f5:e12:b47c with SMTP id 5614622812f47-5681442c1a0mr1599763b6e.48.1794200560806;
        Sun, 08 Nov 2026 21:02:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac6352sm3570841b6e.1.2026.11.08.21.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:02:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 22:02:36 -0700
Subject: [PATCH 1/3] dmaengine: dw-axi-dmac: poll the correct enable bit
 during termination
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
Message-Id: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-1-c48ec19e9ee4@gmail.com>
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

For channels 16 through 31, the channel enable bits occupy bits 32 through
47 of the extended DMAC_CHEN register. dma_chan_terminate_all() only reads
the low word and tests BIT(chan->id), so it can conclude that an upper-bank
channel has stopped while its actual enable bit remains set. Descriptors
can then be freed while hardware still owns them.

Poll axi_chan_is_hw_enable(), which already handles both register banks
and the smaller channel layouts, instead of constructing another mask.

Fixes: 495e18b16e3d ("dmaengine: dw-axi-dmac: Add support DMAX_NUM_CHANNELS > 16")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 7520c78f55cc..49f65486e862 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1181,16 +1181,15 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 static int dma_chan_terminate_all(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
-	u32 chan_active = BIT(chan->id) << DMAC_CHAN_EN_SHIFT;
 	unsigned long flags;
-	u32 val;
+	bool enabled;
 	int ret;
 	LIST_HEAD(head);
 
 	axi_chan_disable(chan);
 
-	ret = readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, val,
-					!(val & chan_active), 1000, 50000);
+	ret = read_poll_timeout_atomic(axi_chan_is_hw_enable, enabled, !enabled,
+				      1000, 50000, false, chan);
 	if (ret == -ETIMEDOUT)
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));

-- 
2.53.0

