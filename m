Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794891448;
	b=uvqMYBm3jKy3RfTAa5LD0F048OL9bhqRQ6YKLl1E6KqYkuN53/tM3Kxn+xeEudew77H/
	 xFrIsHB+O2wLPrwGX9daiemMy1/SfqR4uH0fc7loApXLypvnfWOM6pHoIyLZPoKpamJiy
	 oXuPVSuTq7RkjO1RyxyrRn3qzh7Nu6uw8GI7l7qu3UCJA+MD1SAIrtMAUIsgt97CvTy8Z
	 Mo/wGzCVJ9nSzz0qCh8nL4u30l8CH7dBF8uJGUeXc0ePwA8yFsol+6p7qYp0w/5gCabxT
	 GGVTGn5lw7q20S/8axUK3h4kcTVl2CDGKsEuOi6RIQWp50OcbTwKGo0D6UTtjmSYumQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794891448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=l2BdX2PM3MjAERLH3HIGzaP0PYsAb/KFTZPWDyI6fB8=;
	b=YdKWWrlBdmhAAaRCtxrfivhDY9EK1uvVw6W57PjPY8nr8zZLmNcsLlEiIUuli50bH9So
	 yxAURkBYXHX7Us+oKk3jSLw950+jF1+HSBDYy1nuljPoAj+pEmFi8tvXdDTR8w8jTGk0v
	 4QOqnWJ2Gtu8rPed4h0CeNYy2MbCYYb4zQfZqGxogrVSwYzFYoroVN8Rp0uKIUUohYLiY
	 2RgJiBGLNsGEBa7V5P5mLC3SSGroqTZW2UzjR3pmMrmkHZxXj9SFl79jWqwo1448m/Z4T
	 qQRh4gW0fQgt0Qf357LXPLEcdBxf+xDtZdpWc9bRExDYD0s0i5ubH3KgL2DqeD/oy1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O376a9Kk;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF28606A32C
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 04:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFF28606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O376a9Kk
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so23337025e9.1
        for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 20:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794891446; x=1795496246; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l2BdX2PM3MjAERLH3HIGzaP0PYsAb/KFTZPWDyI6fB8=;
        b=O376a9KkcJ8lT0WSJfqS75ZNGqxnxHKAy2VstZxnkkGwLNvyMvs5vDlVbSG7Ke0EcV
         OTBDZSvKV+4vYq3RTpDNCn2yvj6ae5WA4qjPJmKE/TMo5hDNekqcZ6slvvHcFD91hhvv
         FMqhxGY/1cpqGZC0QT6js9q+7EWtgubc4zhNhwzHDPRFw4B9KDbXaTz0muK3X8k9/oUK
         OU4N2pL17a/jCGA3Kt5WAWHJdBDtZlZDOiRdP+YA2ed1bk/BpDFBnDJwYXrh4kyHanul
         OfaExsXX0X5cykyStRAISVWaXzK83KGt+c6W5pJoCwWImMampe/IRd06Pqd/LbTNmAlw
         YpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794891446; x=1795496246;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l2BdX2PM3MjAERLH3HIGzaP0PYsAb/KFTZPWDyI6fB8=;
        b=J+PvAQZmBmk2ODW7QIFI8co09wLrfHwHb5tPDmiQZeLCH4uZacU7sDtt5m/XFeWDJ0
         9mt/wPvLtSHxV68H8drSw1Mnm174OFs7j0d5v6hVOxQCC2Tzkt9dpFzl7F+f27+j1DEz
         pRLv1fpaKFhNmmHCmj2IG+bt1GCOyzJJyen7MlhIJA6S/mKmvZTq2ve5XjkkBPECUFFx
         +GYjWoW1nh+XTcbTcOekaM9efOQvqiTppXj2bVODNCODpeKPZ3G35/P/PFKZeTZhCTyx
         WmX8TvN1m5b0OqEh2Bo7IXdDeINysJIMlPBZsA9TF9lSmTm0IDIhSviPxnqmb5Dp8u5L
         sEEQ==
X-Gm-Message-State: APuU4Z/SFWIqcbLQeMap/cg1qvtf/Hs2+BqTRkZ7yPWS1qN4HOh3+eBb
	Mi6hDZ+V7R4vusQJ3kZTCOL052f7nuIQlXWH6LBuMcmB8WqpGRHLXRVu
X-Gm-Gg: AYBFou0vhEmpxFAA5KPg5ijK2LLdfuczxLiHNYR0biDDcYNJXh6RNqHiUIVdJsH7EmG
	hGvpVgdNGWjt/8XBe3TQmDBDaNoHgUmIunlhY/rpm/PY1inS/0wJDZerGzla/kDELhc0UZd+kLq
	bgh8meVBdXTmk0Qh1H+6hyDqBhQIv6gUoasVQMP8G5DFKYFQChqnL8WvXEV/zl7/kfyKdItDg+E
	XFYJ+lns06OyZHWZI5LaTF+3d/5AxjZp1aWoxa5GE4gjRZoM3YlhfIsEzsfj4Y/aqE3xwZJXlk+
	1a4epgHMHjeFVKtVByxT3hZbB61tppUdmLCrdTrQwxy3igvaM4ffQ1JSiWuqboCsYXjw+F37LcM
	FaNtRjUXPCpFw3uNdNp7dMXX+GxHuN81f1NkEUasZhHJQfXG/4uI7f3Nr5glinbsPmWEv6UM37f
	zPpnBgDdahvEEmBpbtyOj7NEy46SQcoHceYjvoFU4BA3HaZH5Cpj8LrYALA3oug2kHAVvXn+5Ip
	bcHno0LcDg4a5f0MzKnAC7vq22MEMRiz74FK6iFVoNapQklgHjzgQovM9VNZBcnFRtK3tyvXJZp
	ulJfTpTZWOAVqST+Bsea6iUgp1fLxunEe4U=
X-Received: by 2002:a05:600c:5250:b0:4bb:60da:56af with SMTP id 5b1f17b1804b1-4bb60da5884mr188575835e9.25.1794891445966;
        Mon, 16 Nov 2026 20:57:25 -0800 (PST)
Received: from killingmachine ([46.188.59.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm40571525e9.4.2026.11.16.20.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:57:25 -0800 (PST)
Date: Tue, 17 Nov 2026 07:57:23 +0300
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, lars@metafoo.de, vkoul@kernel.org,
	Frank.Li@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: axi-dmac: add reset deassert logic
Message-ID: <avves747CCfiG2s6@killingmachine>
References: <20261105134040.315317-1-s.matsievskiy@yadro.com>
 <auy6rdWmOnxahhB7@SMW015318>
 <au1W-ig2v0WKezj_@killingmachine>
 <avtkQuwVAsN8uhW6@SMW015318>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avtkQuwVAsN8uhW6@SMW015318>

> Do you have actual SoC, which use this reset?
No, actually I have an FPGA prototype, which uses it.
