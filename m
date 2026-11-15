Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727192;
	b=U9mhZF5P+QOUxo5kzm7WwCSX1qnPn1do3cBF24cyk2Qj0ftl2W6DdQsmbWAlJkGaBp6M
	 VSlitmc/zVRq5mu9qU9/5cBF4TxB9mxYk45FhJum8IQPMMJ8Ww/Vs+vRMCTiqD87OZ+3p
	 16QY+OENpV6Og2xQNhH95SP0b6fsT9e4OUXyFr5XqmqzI02hm7dqSYctCXEi7iWfYMm3h
	 qm0g+sI7x3PZl0HnR98KaNIlYJeyxDVX086u9SBf0hY4XdtwvLgnq8ZA9JFxZkuJTCDyq
	 76jkS7TI23EiLlJ4fXcyXx0ooesGj3v4Gaf2Jk1APMiT+iFjRLn0+/j8AA3nZgEAI2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7xV7K67o452vhJBNNJkVqcceAfykbkpk6Y6a+s1Bbb0=;
	b=0+PYOjjV+6PNXotv9vbAo2h4NQeAHkIL1lSkf8j+SKcDS+dz856os6O2R5FGgCAbVQiC
	 zf8/VMHYirVJA7Gj9DWTrT9qxsxMINdeA2lMDCu5SN8nBEzesz9+Bovhsy7xM3c3fODfl
	 KA1cfr4nIG5YsA5QDipV/9WQaRQRiTHOiolIuoz3bvff7pl9GMWrutP0EqHfj85ih1BJh
	 72FQiXcjcXYzm0ig1xuvQmdHa86Iyu7q++xKHXNiO7O0wrs4tdz3YQYeXFjMEVDDhgkeA
	 fGNnWRUlwxRNon7lOOQy6+5fgCx1IT5eLuHw/V+Ic1as9cM+IYrTiO3iIBr9IPI1Omw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2YgrPrk;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C82060A380F
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 07:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C82060A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2YgrPrk
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71ac798b8bbso1114004eaf.1
        for <dmaengine@vger.kernel.org>; Sat, 14 Nov 2026 23:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727191; x=1795331991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7xV7K67o452vhJBNNJkVqcceAfykbkpk6Y6a+s1Bbb0=;
        b=w2YgrPrkqUsnRysCkNMt3GErNmxcugHUhCjZJugSCecv+b145Mg0blwX9XY84sOBNZ
         kHi4poF3jcKjW+SLuPUNnpRvHfw7fg9sdry5lgGZu/27hvwM5i1rl7t98kY/dGs2VooG
         RJytCHNMMaKDvgiStjN+6n5nho0U2El1KaOixb/8s53a06CXKSh5AAQc/QnCkhemfnTh
         Cd8T6pbZa7kuLIpYgJo92wipYNH+qyfEaj9nPqmpsjz2dmYKeedxVWEOqafLBLfCkMbd
         EopS2FBcglZdJ4oAxwhXjrriBhDUnO0GHVm6yy6AkPHAYGInCeZcH3p4fEoBjUe1GtSA
         bNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727191; x=1795331991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7xV7K67o452vhJBNNJkVqcceAfykbkpk6Y6a+s1Bbb0=;
        b=pt/d//uCuVi1pN5kXIbaV/2zIIooJTn1kDxwlcWnHc/wRYshpdjfWoJP9phDhC+52l
         bRrr/75A2oezynwIg7q6mVeqCP2Aqug3wSFclSREPH2wDWtvAe8DzbCN4l1xgynjxJC8
         FOP4O2mUEc92uveGGdpeabJHXWJgKyc0aFYP67smfmmSZLbVI156AG9J45/qd9i41nn+
         cjQPVnwypaq16diDddBm5s+F+4HxdYwsGCs6GHY8uX1OD8kzkW84WdYTZWs62y5WOPKP
         oOQ+tf8fF+2pZWrl6qt7owa2yVN3kRvT/3CpgMro7c3o+KqqamF6EW1DYxfnQmPUIcaK
         hkjA==
X-Forwarded-Encrypted: i=1; AL+hErHGMkkPTRqArhnXPsnt6IWgj+Y5qiqkIWLZg4x9paq3Nyy+U9iGEjdnBH3ojbUQGkqGIkT/LS3r29s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NjVENfuZh9Zw3UWM4rTUM9YRuLbjVmFne849sTsTgWYOJck77
	zjBXqpt7dxEEo2qxrMStBwffwUiEzcGfwescVMv//ek24m19vtzCQEUQ
X-Gm-Gg: AYBFou3LLKuZooGi4OlmLsOr61rn+2EiSh15x1NdU9w3azt6mrsJgBLu8/e6+aOsm3Q
	xrRKTSdOD9xDPVqGnfjTFVTvhuTDwBQvaLCkApSDgsKB5QLT/UyDBKtDpjzALdWgJAdxLDut8J9
	7ixYwhGGDQ6QWi5wpzOQ9nxVgmX8Dq3WWEQvYGYzDTCaXILsGTySlesFgYfEGLbpdoEos5OuYJh
	cLgji7UdKDnF+BuIAsehCHJznaQiS/0yjoe+4r6KchoXypZXawsB6M5qHeMPTiqImsFJVuAXQ+0
	Qj8CSjqjlelwbjZdN4GYrfE+aoKKw0mh/tvSZIJwarVraStqA1WEVAoKlx4ZvtDgnwZCHBphU3N
	drPp8/TUSrEvQwHnBMWoRed6Y5Z1ExObGqaqkDnTqWWfsZzUlsap9jCXqmq+ypWxKRiJFYuG690
	mh0yJEn0bgNUARHnm/7pZ97B0YbomGWkvPVSGMjfgmAbMH/iEt/u0YB80HVSd6hBKmaapPQRtcZ
	YuEZOyhrM3JkW8nCKnts+7LBWwQMKbZzC5Hx8ZgApexcGIJlBgEE3Vew//AKcxl3viP4BfHBlUp
	8sJeq4k3dghMY7Mb94QlF0NfqyQh8XS78vr0g/1ME6SLwV31Zs+q5G07F5kvCRhdlFG9Bvthw7t
	1NNQ94AMpR+AudVhb1k8kUw5cYkSNJ+ENkgyjYI3LF/Pp9huPoTqgAclHh0Os99PgM+F5ZbZfxN
	gmVHHpZQvGbHeTgdcjAFywDSq1VjvFmfJoC/3rd4C5gv/OFAGuMLU=
X-Received: by 2002:a05:6820:3385:20b0:716:bfdc:a084 with SMTP id 006d021491bc7-71ab50d4472mr2939790eaf.60.1794727191190;
        Sat, 14 Nov 2026 23:19:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ae860ebd7sm1145321eaf.8.2026.11.14.23.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:19:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 00:19:41 -0700
Subject: [PATCH v7 08/10] dmaengine: dw: drain the tasklet before releasing
 channel resources
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
Message-Id: <20261115-submit-dw-dma-synchronize-v1-v7-8-8d58f3d49e4d@gmail.com>
References: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
In-Reply-To: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

The controller tasklet invokes callbacks after dropping the channel lock.
Releasing a channel can therefore clear its configuration and disable the
controller while that tasklet run is still using them.

Disable the tasklet before clearing channel resources and re-enable it
after updating the controller's in-use mask. This waits for an executing
run while preserving pending schedules for the other channels. Have a
pending run return before accessing registers when the last channel has
already been released.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index c602ea01cb83..56a422ba14c1 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -419,6 +419,10 @@ static void dw_dma_tasklet(struct tasklet_struct *t)
 	u32 status_err;
 	unsigned int i;
 
+	/* Channel release may have drained a polled completion before this run. */
+	if (!dw->in_use)
+		return;
+
 	status_xfer = dma_readl(dw, RAW.XFER);
 	status_err = dma_readl(dw, RAW.ERROR);
 
@@ -1062,6 +1066,8 @@ static void dwc_free_chan_resources(struct dma_chan *chan)
 	struct dw_dma		*dw = to_dw_dma(chan->device);
 	unsigned long		flags;
 
+	tasklet_disable(&dw->tasklet);
+
 	dev_dbg(dmaengine_chan_dev(chan), "%s: descs allocated=%u\n", __func__,
 			dwc->descs_allocated);
 
@@ -1087,6 +1093,8 @@ static void dwc_free_chan_resources(struct dma_chan *chan)
 	if (!dw->in_use)
 		do_dw_dma_off(dw);
 
+	tasklet_enable(&dw->tasklet);
+
 	dev_vdbg(dmaengine_chan_dev(chan), "%s: done\n", __func__);
 }
 

-- 
2.53.0

