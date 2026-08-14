Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA8A3CCFCC
	for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 14:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786717673; cv=none; b=cDnYofIcx1C4bXmeHCyvm07v1zqWYTiQmRDTupj95LQi5bBpjAwwH7k4+HasWsxumZpBpLPlz2jNfvmJ3uAd2IWOqqM1Pg09leXPafy/q/gZ8sFzdWDmyQFetbx50BgGL+XoGwLZBNp4QXOta0bKjINydGEfVbsyBJgo5lBjaOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786717673; c=relaxed/simple;
	bh=k0KzLk/Py5MfNs6v0LG2pawI7nCHX5oUhShrr2VzixE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/VatZFFVHfyQetMTSislxB4cFtPW/awaeFThmOjhKDhZQfwjtuzMfyzXdwpxNeDnQeMl9xouCZNyfd60jzaI6k8y4mlaZp59vwPTOJ/yNS4N0QLKbal0Mr8+d+KEk69EGktBYPpT441reD098ASjlCVt9bmzXReQzJdCCz8gho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io; spf=pass smtp.mailfrom=soundtrack.io; dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b=Abk8hbO3; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b="Abk8hbO3"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15e62c695cso8252466b.1
        for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 07:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786717660; x=1787322460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8f5UJCABHvmBw6dzoHdGzw6KbaLnhVEoCCS6jqmRT4=;
        b=Abk8hbO3uhyHVYxm90lWMY7m0s1iBE3oGJKs2XJgQJ09dUKp5u+hpy8pMULNG3S4N0
         e9pukQFGcMYrj866rPOzzYuIRgTQHxq+VgrHhKSqHqIV4NL2KQwI4Z0BD8Mp1sTvz3LM
         1Ugb3Rn3Np/3gUXKg/NOKV7OmW7VFrLGUsUcLUxd8plGza8ue3UV3u23tsXSj4kYYawL
         J7kC1N/xMNaSSysLroGs/baRvrSRAS7FQHZwZLnkac4pqIUoF3KegUu+PaJm01xPISTf
         vwVFJoGrz90CFCe49XxKrtsGC/cUUE0svJth8QhQWh6/8afjYQ7ikvKEydsyEdCZOV/0
         g3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786717660; x=1787322460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8f5UJCABHvmBw6dzoHdGzw6KbaLnhVEoCCS6jqmRT4=;
        b=EDOAW8X8Qf1iQPq4KrqG8nARb4HYr4Pd1yvyzGRawiwbu7ai5M6uF1D7DkuAIlnAgY
         qR1WAONht++l5y+4z6UlhSa7wfKOq8uFXA3nXemcenfcVX50lVUHYUKrNo+2jP8KzV/e
         PmMK95b//4UhPas4SoufoiNuYHDvM83wuhgZ0+qs5h4BVq+4T9SATgfmIUVO3GsDos+R
         kW0vsroWiLzwkNVzI7TKL3/YzbUAJf7UTss+1xxWrBQrU0OtbRaDTLs8maepeosCaLn/
         +7V4OgPfHjuiBrANP20fcLf3gbLKcFFKaWlgoHvNlCGDTp6AzHgL4EueqN/loIyT9Mbq
         cBHg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6HUF+z85n/J0TV4ijP9GuJKazMxr8ywVtoxRgR3oQPC1kCZA6PLPbOzGzrJgLh4j2WM15NcsClfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YznmLQdUhjHz0QX3HmnwnSxKtd8Hi8ElPXzl2KuF4t/ztsWVfIf
	7VGrxWLzCoH9YjhEtBMTqT/PhBCyx8bcOm9rdJIarXTmD0zFbOPHgUWeKiQpIfX4Gjo=
X-Gm-Gg: AR+sD13dv8KF79GsXYyH/hg6GCGz4hBUltSH8Lgsfn0k191qPWmR6pydWbUHwsYfpcm
	+5TckV+4Irz03AL9A1L6I6X9FeMmWGuZeIdDeFUdntgB8eE9JWpJrO+p0b7T01ewGbdczVjYrmm
	dvsqiOX8lqikUwG77NHWg8xKEJDuFY8it5JfLZ0MNyUif6tstNkiYY70TwqDCNWnZfc1+XIdgTa
	U1m3aikyGEK40KV8XfEMoMlAFq9/55WVCECt6OusUfleD1cBRVqzzKBsNsJMtqFKrowVj53AxM2
	cdLgXCejmGYVRQdOwkvDaq9WM4n98hVsx8I63CotFzlNjfKuD2ws0w0QmCDNnnum2fl2Cztt9dP
	PBDyajuKdZcJNIby+SxCoUfoyFV/tZyfcPdubsogGwKE7DlLhdQt+mvpHq5KK3wLwprprMqibVe
	leL6gg5GNp5fwxOnfInaJOoQCyeHiU1c7tLcKycaWhl4B/Ra2UFHOtHNvlGW44e+fviyqHmxfw4
	n9/ZRbpoD6006gyq7BJ5hPD6NcFhPDp5zuBLqPHwYMqtX8s80KIrnGUHA==
X-Received: by 2002:a17:907:9403:b0:c1c:4ae9:b935 with SMTP id a640c23a62f3a-c212a22e029mr175852366b.3.1786717659858;
        Fri, 14 Aug 2026 07:27:39 -0700 (PDT)
Received: from Christians-MBP (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234c45ffsm106308866b.19.2026.08.14.07.27.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 07:27:39 -0700 (PDT)
From: Christian Lugnberg <christian.lugnberg@soundtrack.io>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Lugnberg <christian.lugnberg@soundtrack.io>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status
Date: Fri, 14 Aug 2026 16:21:11 +0200
Message-ID: <20260814142708.79120-3-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814142708.79120-1-christian.lugnberg@soundtrack.io>
References: <20260814142708.79120-1-christian.lugnberg@soundtrack.io>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun6i_dma_tx_status() calls vchan_find_desc() to look up the virtual
descriptor for a given cookie, before checking whether the pointer
vd is NULL:

    vd = vchan_find_desc(&vchan->vc, cookie);
    txd = to_sun6i_desc(&vd->tx);   /* vd may be NULL here */

    if (vd) {
        for (lli = txd->v_lli; ...)

vchan_find_desc() returns NULL when the descriptor has already been
completed or is in-flight on a physical channel and no longer present
in the virtual channel's descriptor list. When vd is NULL,
to_sun6i_desc() is called unconditionally on &vd->tx before the NULL
check, which is undefined behaviour. Move the call inside the if (vd)
guard to ensure it is only reached with a valid pointer.

    vd = vchan_find_desc(&vchan->vc, cookie);
    if (vd) {
        struct sun6i_desc *txd = to_sun6i_desc(&vd->tx);
        for (lli = txd->v_lli; ...)

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Christian Lugnberg <christian.lugnberg@soundtrack.io>
---
 drivers/dma/sun6i-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 04fe1f5042e9..7704b016aed8 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -981,7 +981,6 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	struct sun6i_pchan *pchan = vchan->phy;
 	struct sun6i_dma_lli *lli;
 	struct virt_dma_desc *vd;
-	struct sun6i_desc *txd;
 	enum dma_status ret;
 	unsigned long flags;
 	size_t bytes = 0;
@@ -993,9 +992,9 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&vchan->vc.lock, flags);
 
 	vd = vchan_find_desc(&vchan->vc, cookie);
-	txd = to_sun6i_desc(&vd->tx);
 
 	if (vd) {
+		struct sun6i_desc *txd = to_sun6i_desc(&vd->tx);
 		for (lli = txd->v_lli; lli != NULL; lli = lli->v_lli_next)
 			bytes += lli->len;
 	} else if (!pchan || !pchan->desc) {
-- 
2.54.0 (Apple Git-156)

