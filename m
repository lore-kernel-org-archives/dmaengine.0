Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111389;
	b=27RPwkBstBgh0KkEoKTmd4olrkIy0btQ7VUxZ0LREpizzZ8zKcgtlqO0+oeGlv5bLdb4
	 ICawCMmisv8RRIEpUtRLGtv5jgmsmvLwi539/a6jhXMAI3YBmf3q8KX0iRxRVCtpguO6S
	 ybPGklW0FEOxRzXBDmytWbEAmf2wxwxua7vM4btxJYhtqKZvktBnRg3YyYYAosHfTUtxY
	 emE4SuTHf6/zF8VMekO8KWTBjZnnM3lV1tfAK3by+BEcc5NqkyH3CV7AS/O1whp0H4wdf
	 Drf0Yl8N/Frn+sCfTzc9Yoj0gGXGly81GkWuq/va4FHFoKyus0JOihcyXs7qxxCRnDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=I06+c10KQYGyPd16B/H1g1q5/WZ+PHIJV96gXM/5eoY=;
	b=10dVw3wpn+eh81A5YrtO47urcbdRWPsKLO0CywkChR5B4RCTM8aCMLzuTHJnpGlWK/AB
	 jP/HO/rbjvkBjpWz2t+KkyUnr2c/uHh+eY5M/giHb1Ac5stPO6BxGb0Trleyk6uk7Nt3Y
	 DiKuefH1H1VPb5OlKIDGy8M+usLlGSK+3DdAzxsECG+nPaH9S0+UR7BidZH6pP5EvQ55R
	 f5cZRrysKCw93+DuvxxXE6ak45rNEdqegY5ersvsZNeFPJH2/bGDC4F278Cfc5sf7vu/R
	 zUEVf8i62esv3zaA+jgg7JBZxcgG+GKBfKWlcPfhnWxN+2righqrmUCdxdTRHKdWVVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DYEpxgBw;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9177606A330
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 18:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9177606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DYEpxgBw
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71aed54d4c5so14428eaf.0
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 10:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111388; x=1795716188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I06+c10KQYGyPd16B/H1g1q5/WZ+PHIJV96gXM/5eoY=;
        b=DYEpxgBwNBU9ZlLRYeAhl+VOhhcyolS1iutkHkIZMJ9kiaeJ1r0CA0jkLIc/iyBk1W
         112kcn3WGBsArIWl1rG5mZAwDixuG7iqQveilbXR8/vz4bJ+B1eeHsWkKr5ScXkh7QTL
         QyFg+zYIkKsI1R64Ka/g0fJWUIT+aTMSFqV8wuN4Fy36KJQat+7olupQ0VhHJOLqSLnz
         XuAFDTGNWF9mNFVpVvaBs9zvN8OTNUR+IbWbqJd6AkL+w4XdtcljwinV/48smMNvt3eR
         ZGuUWr8hirI3DNYTdRPKL/YXQLWDtcw+ISXLJ5yl2NZQy5Y/llVWw9dheKI+4/ylB5Ay
         Gc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111388; x=1795716188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I06+c10KQYGyPd16B/H1g1q5/WZ+PHIJV96gXM/5eoY=;
        b=QD60j/3auOjKjJl5DVLppzSAkKweOpokt508m7TofRzC2i9jHnfe9bpE9iCCXsbhRU
         +H2HVWd9DoKAkDeCO2iTCzsxmAsvfyvy77Xfw8DRsV8pt17hkpr6+pRLD/8IVFn0l/Ei
         Hin+u1gnv3FSgH00UHMC/xT7j+pjwjTBcxCmZKT7lH1aPML9YWvRcqkJ6cnaNCKoRl2E
         4SiHruhnAR4zaA2U7L9/MYMLQ7i14jBJtP2ONC17ws00rVlwYe0JNR6FQwpoKx7ICxLU
         H5L8+ozNqQigzXjKAc7Lot6+/Wu/Oye0LB7pZhpaR+HA6CX3/pPugURBJW3T6G9yJaM9
         jppw==
X-Gm-Message-State: APuU4Z+wHIGZQRDP62w7gp7vM0Leomt6MKBuouTIuJ5mWLXeEleq+oas
	PabPH+n22yaJmav2hvLc1g3Tm30uW30pHekWFIypvb/fs0D5EspDnU2P
X-Gm-Gg: AYBFou1p9jxR20Boa/FzSDUWQLXqbwpJDwvT4BbNU3yuUWj3SbJdEZoTI8sbxO3QJUs
	M9TC5r9aFZF/1OMy0sJDqEkOqwAIz1266EDgkcmlZAFyrap2yj191oUu+eEJaTpTPRwT/gfFNnX
	PR4l6gkcpL3SszS5E7gn5yM7YuUT6FGrIlvF0J6MLN3XpfgQXe2h+JCj0YmYCDC/0rEg1sKmVMk
	3TXTa8Q55WriHClSuf0p63Ly87NgUgQ7azPaBSj2DX+ctClnltIP2zsB7Bzc8MnRUbNNL/9AigU
	lUFBA+ZdySIu4Fb/giQ10hPXVrqvDVR/tpN2xoGTvdHmBip6pP9dGQxA7soUFmCcu1r0b7/TSv9
	frFrKfcd3eYtJnO+Ei6hKeKY12fHvbSqJj4VN3gHAeOA7MoK79AIGko7DqPEl08Jc+/zX2+dQiD
	p4HtrdMk37tU09fvkqnTDzlvGrJuVaweALKpcyz9dEngWqQGIK6HixTYpD2z/rmiYVxqi8ahsgo
	J/Ozi1pzFTdIa+SIjVsLRFrt/NYgWXG5TvGa8WpRdPfLHcCsy+0iw03DqK/1fbGPrl547ZcYibV
	SwCy8NqHleNasmHUX/Tol2gzui03fL/KomY8cwbdj4ep56VzRUau0ya5PmSc41SaBkdHdMrm7FG
	u/p35vo3jPS/7+G3q5Lwi1yTBV/5pFXrzjzX4cdSbTNxbD05I/K0oMg08sy1GHz/oIXJeY6NF+k
	XRNhN6iA1sNEEn9IC0azUCwLNvbd+Jlzkj5NI/S6xTeX1FWnS1bGPe
X-Received: by 2002:a05:6820:340a:10b0:716:db9f:682c with SMTP id 006d021491bc7-71b3960e47cmr234297eaf.69.1795111387559;
        Thu, 19 Nov 2026 10:03:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b3806ef20sm448478eaf.7.2026.11.19.10.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:03:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 11:02:21 -0700
Subject: [PATCH v3 1/3] dmaengine: virt-dma: share deferred descriptor
 retirement
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
Message-Id: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-1-3935aef58db9@gmail.com>
References: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
In-Reply-To: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

A cyclic callback can retain its descriptor after the tasklet drops the
virtual-channel lock. Collecting and freeing descriptors during atomic
termination does not wait for that callback, and clearing vc->cyclic alone
only cancels a callback which has not started.

Provide vchan_terminate_all() to clear the pending cyclic callback and
move submitted, issued and completed descriptors to desc_terminated. A
cyclic descriptor moved to the completed list by an error path is still
retained; completed descriptors already detached by the tasklet remain
its responsibility.

Leave prepared descriptors on desc_allocated: the client still owns them
and may submit them after terminating earlier work. Freeing channel
resources, unlike termination, still releases these descriptors.

vchan_synchronize() drains callbacks before freeing or recycling retired
descriptors. Repeated termination leaves them on the terminated list.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/virt-dma.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
index abf2ae737c30..f753c6b62d6b 100644
--- a/drivers/dma/virt-dma.h
+++ b/drivers/dma/virt-dma.h
@@ -199,6 +199,25 @@ static inline void vchan_get_all_descriptors(struct virt_dma_chan *vc,
 	list_splice_tail_init(&vc->desc_terminated, head);
 }
 
+/**
+ * vchan_terminate_all - retire descriptors until callbacks have drained
+ * @vc: virtual channel to terminate
+ *
+ * The caller must hold vc.lock and prevent further callback publication.
+ * Submitted, issued and completed descriptors stay on desc_terminated until
+ * vchan_synchronize() drains callbacks. Prepared descriptors remain available
+ * for submission. The completion tasklet owns descriptors it already detached.
+ */
+static inline void vchan_terminate_all(struct virt_dma_chan *vc)
+{
+	lockdep_assert_held(&vc->lock);
+
+	vc->cyclic = NULL;
+	list_splice_tail_init(&vc->desc_submitted, &vc->desc_terminated);
+	list_splice_tail_init(&vc->desc_issued, &vc->desc_terminated);
+	list_splice_tail_init(&vc->desc_completed, &vc->desc_terminated);
+}
+
 static inline void vchan_free_chan_resources(struct virt_dma_chan *vc)
 {
 	struct virt_dma_desc *vd;
@@ -232,7 +251,7 @@ static inline const char *vchan_chan_name(struct virt_dma_chan *vc)
  * Makes sure that all scheduled or active callbacks have finished running. For
  * proper operation the caller has to ensure that no new callbacks are scheduled
  * after the invocation of this function started.
- * Free up the terminated cyclic descriptor to prevent memory leakage.
+ * Free or recycle terminated descriptors after their callbacks have drained.
  */
 static inline void vchan_synchronize(struct virt_dma_chan *vc)
 {

-- 
2.53.0

