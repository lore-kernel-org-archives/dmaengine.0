Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC99E2EEE90;
	Tue, 28 Jul 2026 20:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785271226; cv=none; b=TMcoPV6z3+XJ1EykMAexKKWiNqHLVRKS20atHulQ2GTGqxPgd70KXTihZqDxEESAqXKWe4rk2Yfjv7mV+8nokvT5rucGrIMwPQ5htU/bk4vTdIatdMl1rAECzwxLEhKz54SmqFVqXzVUe0JeC8DQRp0JzAfcLBuzGFQbTdaVM98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785271226; c=relaxed/simple;
	bh=86COEs/mHBkGYoAAymBOgyqDk7G85ARYxqJduLepvAc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=NX6YYh3rTR9HMBXy/O7EivrDxIosYedz5n/TygGk8BnEy2YZ5W43x+72POb0ncpxH3W6pbMwswRvtpCeEdIG4LXeqgUsPQQoBQhX/1zi80UQO3Br1rqDfkQFva0/UqTSh4D5ZYYBwa/2WNcCek8tozNJ7Yp7ck4fsBxmTqewKyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=OV4FbRM2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZVZgEATC; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="OV4FbRM2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZVZgEATC"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 072AE1400132;
	Tue, 28 Jul 2026 16:40:24 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 28 Jul 2026 16:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785271224;
	 x=1785357624; bh=ncaGeK+w4zvtCBMa+JKe3So2pBG98dyXRq1lAp7A/Y8=; b=
	OV4FbRM2Vy5o7W+QpwRaBFIgcdP/7Dg+aF/BFQOXfv3yxGuzep7NQwpKPW2y60Qx
	F9e7k2wQDgvZVjyLxFtBRTjkBX69/ITSGJcUmnH3GDo7hPBOI6Huse+z6rXycSRW
	LvRlbg8Kg8gM0+YJY6TexMPbm2/0mMC+1RQt/Pvwc/5nEwJhE+lD93hsnQzqWSgl
	cytfvK2ULRI7RMnpY3xOHXZ7Rf0jig8V9ZynZb4rTsDk9l+sQlSSEQ1TsazDmiEh
	1zGC+rBuc+FturphTk1itFK0qcr6AHxC9rkJQ4lNAeEnh1WEkfN12aMkEpMgMOIy
	wbGHGiZnO8UH1U7L4VLnTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785271224; x=
	1785357624; bh=ncaGeK+w4zvtCBMa+JKe3So2pBG98dyXRq1lAp7A/Y8=; b=Z
	VZgEATCRsRFz8SzGGRU5iAQgJcXkp3U1EhYEHt4GpEp2HrO6dI0UI7R7Lu0zfif0
	Sfe0JSGWMNN7SaJ47snh8duKH2zjiYfEqbz4FjwNHH0pPg86asSN5q6v3fNB7u6j
	1V+87RVv1E4oow6DMNf1OvE1Rq0Xf+zC8k0t7w1fKOHSMreDfL9BdDxDr4czz1gj
	jhXaBGF/OYNC7tld0B/80JE5SRMXYubEX4CrfkmB6TBTz0mmKeNPkll+p/mz+5wY
	rEyWy3pQk7x7FBzqfctlTRkgpfQH8aHc7dE44vWJQvHQOWIB/BILuxSW7KwsNE+f
	h3dmLgckEOZvjpRzJBW6w==
X-ME-Sender: <xms:txNpampZnD_mhYRyThjXDmXF0AzGDKbgZc3Rq30nUQFMNAdpdpHHpQ>
    <xme:txNpavchLsN2HK5LCMi_EQjGWlosCIjMshuXaJMX_JzvDJ6df14v_OL2xh2JBx4JR
    6e4Ekyh_YKzC1EK1EuSh3BKeTcKRiz2Mhj53kdem9TkUAuExpnr590>
X-ME-Proxy-Cause: dmFkZTGU18nV2eGndwdyG3Aq5xqmfwTGYj0GOzICME7IMKIrVYYjgBgd1VWVHHAUOP/SSK
    CQEAXfRcIHTbP6Y6FOUpwKmgpir+2t7b0KI5Fm3nfFLXvlTveadhMA5fa6LHdVJr7Cu2BE
    6h8HQzc3Fv30gYNIGpUYYArBNGnGPod5yikvkARWWvL224jqxUjngwldvgWh9C33Zturl/
    wZe+3n2mE+n/V7mN5DCAdszw/MgAMnsXBuQXBJZfxihnLzUBxeaYSoNssSZcY6UzLooRBW
    25pgz+/ZGFR0B5iammib1Hf0fc0Z6kNVb1YD2fPsT/uE46c3FXHjQ+wLDLDS9sVglAfjjI
    9Lz9+V2llSK676qgebxqcrnnL2dW405igupUqwT/rd4H5hkz2SSkZNEcedvN+0ej5jy9Sy
    25rC0tfpGEUeE+rh2XPpc0nDqLVdea4A5GXG/nWfBhkaLmaSGBY55/GM7ZKsy585x+OduO
    p2DSVTx5nImvHVuly7xUWK0VZz/871H5iqh04ra0gO49nHbiqQIZzJClaF1c/fLu46cAvl
    yN9K1Qd8yUoU7ZBCwHSLzQYiKB26OukJ0Yk1/5kCb3NCgAPqskC9dHgVr04mfBptewg4Te
    JCdi7r2dukjeINA/Y+J1l9UMeodmcgdL774znqbJgBgOSIgbfbRcWGmm5JiQ
X-ME-Proxy: <xmx:txNpahoa4rlgKJbC7aOzD6f7YMJpOa6rnOAbchkb0F-55V0EZ2dsuw>
    <xmx:txNpaumX4HMCHnPPMZFVKwmGm2Un60DkGyF9mBnL2f_zI75ougEDSQ>
    <xmx:txNpatN68EWnihTyu5JDgI3KRVp3lqnMBOgFcjfPOWhSOtoNyqfMqA>
    <xmx:txNpaiPiDwkH4sgdzRm0Gb5Che9lIB1VJTn4Ba_n9u5ehbaw5vOD_w>
    <xmx:uBNpakDyBub_i50Av15Y3HSU0CFr66dy4kk91FuVqT6cFAn0jckpzjgC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id ADAB11820082; Tue, 28 Jul 2026 16:40:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0gDmYe79iQF
Date: Tue, 28 Jul 2026 22:39:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: Allen <allen.lkml@gmail.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Frank Li" <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Kees Cook" <kees@kernel.org>
Message-Id: <57352fd7-fd12-4884-baee-5a90ab403664@app.fastmail.com>
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
Subject: Re: [PATCH v2 00/64] dmaengine: migrate channel tasklets to WQ_BH
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Jul 27, 2026, at 22:28, Allen Pais wrote:
> Hi Arnd, Vinod and Frank,
>
> This series moves DMAengine client completion bottom halves from private
> tasklets to a common per-channel API backed by WQ_BH.
>
> The first patch introduces the dma_chan_*_bh() API with a tasklet backend
> and converts virt-dma to it. This separates the driver-facing API from its
> implementation without changing callback context.
>
> The second patch switches that backend to a dedicated WQ_BH | WQ_PERCPU
> workqueue. WQ_BH keeps callbacks in softirq context, while the common API
> centralizes initialization, scheduling, and synchronization. The
> workqueue helpers remain internal to DMAengine, and dma_chan_kill_bh()
> drains scheduled callbacks to preserve tasklet_kill() semantics.
>
> The remaining patches convert driver-owned channel completion tasklets
> and update virt-dma teardown paths. Tasklets used for controller-level
> processing, recovery, or other non-client-callback work are deliberately
> left alone because the appropriate replacement may differ by driver.
>
> As agreed in the RFC discussion, selecting hardirq callback delivery is a
> separate API change and is not part of this series.

Hi Allen,

I looked through the series, and this seems all fine to me,
nice work!

      Arnd
