Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939198;
	b=Nl2yTo/afBD0hPGysonmIW4enXOBBESTYDekiypJLtFFB/yMpBefeCX7jADrfUVPo2qp
	 yqfgEu0MtWdAVS1h/A9IS+Mgzrqf025thxEDt9W7hpUFLEtgW4hKf1UYi8Kqx4OIp0RDe
	 +b714YasbzNH7BqP0Ty/IyVphCvRf6TfeDXeretvkaxMK5E7YrXVkMxMHN4HyJ56Yn+30
	 Orv+4OpkJmTneGD6D0OjtxPAUfCjnYeYcjtSVnBr4miO23tQPPHMbc9o6tvHt2+Sij27w
	 U+G5rrxcoAvwAkJ18VSUu/bGpfHcqTZfQm00EQoC0cTp4gLzD5wbk4vTIGxnbqaKumg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=yqqoCCSV25YDMJFTaDlaW1nqQ2lWTghScufGi6Vr9TA=;
	b=XLFSadhrEv5iI3obYFSOkU2G/5aTKo4QWwXBQpaH1AVFI4CD64SW0vjzhVl1dMGtxZbQ
	 YxbncyNwxgw9W7IB2d7JdMFkChmdP3dKhyAzxEUX5Hr+CVCOnc5qLOv2rBSchAgL1n/+l
	 663fV6aKSdhJYgUd9qqT5JVDwpp66raOKWOtRL0JbRDyTnfsE0C5rxVSpj0ju90E/lhPx
	 nJZfHsAdlDht/X4DpjZyC6vL527Xs93/Aii7xz+Yhl/rHuvb9W1bRl0OMsxlyyAlTiQE5
	 qQ4tXru0sMbDxbyckSXnn1DRigWCjBHj5OUrZy7TL7G00LYsSedS2iLn0dpRpEmWTyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dIX/lxqM";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CC3606A326
	for <dmaengine@vger.kernel.org>; Fri,  6 Nov 2026 04:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61CC3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dIX/lxqM
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so2537625e9.3
        for <dmaengine@vger.kernel.org>; Thu, 05 Nov 2026 20:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939197; x=1794543997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yqqoCCSV25YDMJFTaDlaW1nqQ2lWTghScufGi6Vr9TA=;
        b=dIX/lxqMFqafQAodHyvzieA/aDNfNUoG8RQU6mATOkni9/Z9yISN2BpIi/jczUhABX
         bY/LhYxY6MQYscOa8o1cKmuZ5UH66NaM+Qb10eFcEevapXb0bWF0G1mfd2LJVkHsP/Eu
         MjnixiGNmF4x9oBwzQRrqGYQPikCFlWgHG/tl/1aBcdJbc5ZGFKrTtwILbdHzZpS3RV+
         CieD7XVioDnw3VQlAiiZZcFYjeJeIN8jHGov2P8B6ivuQ27yp4PTLG910B78Khyvm2BC
         A7e3ZGJH0vgZAL94CL3tDBAOB5rQrL9ybCFYrkQp32zuxgg9Eo0+OO1bHulS/8b9M2wl
         kx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939197; x=1794543997;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqqoCCSV25YDMJFTaDlaW1nqQ2lWTghScufGi6Vr9TA=;
        b=IQ0aR/Sx0+BoCUYLteX8zxS7T8kAQdgWDRfJQSSWzdSjtM5of6+JrP4sjqN+sX/gva
         iGsJv8Vmy0InQzwT1T7heoThCmXAQlauKJAvjxQJvP0+4ko1VA1QS1A0FIL9oCVdM0ED
         BqOQpshsd8WvTEZv/ctX2UK0q3R1hdRxmm15+hQsslcNGpFViy5fA43jchaxNXAPqp8L
         6Myxdpmm6c7Gs9mLBRPYhTklms5+Wafx8ZnkR9Byf5H8ew1wS8eN0hdMEnTcxSfeCf8W
         kEr+QX3Iq9CXLHlo0vfziaJy0XkRO4tdc3/IvhT4zktkKPY7hCchH4NTxOBxUF5KSpKc
         Agdw==
X-Gm-Message-State: APuU4Z85X1mJcqwcf1taeiMuMBmyyfh7R5HLp37a6gjJUxiYaReWn0My
	3Gv9NZUcRz/C0Pwcmy8cX2nxut3k0xdpMUCGfUQUxvZCJLugYKB5KTNW
X-Gm-Gg: AYBFou0vn6iQo+tRgPq4wTOHqma7ekegBmwMjV46G1idHW+Ia6DPyLRAbzaw9y9mvHn
	O1tzLmig98Rn7TdnigNSzsbZVvtfz9Fe9/AUdUzT9upe2DTV8kJV40XNH3xsnd8a+TPiklmTrDr
	JS31yNpPWDw1Y3Zcx0Vx1FyvV4Hvuhf7I5Zav+A1sbEjf+UH75FeHOZ5FFM14Pm05RrF7fVJRI1
	HZVktfbAyu8atAF42hktld2aizblQ8Q2HhQS6zF7P/cvnaczf/5hH9cddaj3RSHN1hpt6riG4On
	mRJpBC8Xrq0okJMLDi37gJuHIby0cPGryuSM65dP36J9tlXrpTgPh8ROW/M7K4/DVfn8VzOSBpQ
	2mKyDU+MNFChfcwHDjMrYbraLn1AUahDrJw6rDMuoCRdx+BunV2m4Y4fBX9G1/RpJilfstkCwpl
	cjyi+n7031Tm+SnUHL7ze+wx+Jt6uST1qq1r85RL9T36XSNvEddEX5OUIWrIf7WorW88g4dlxR0
	2NzUkOaJrF1Smok2HPlfH7BTsy07b8MW3ralwkoUuNYXTPJv4iJGbr+VHUJKqqeBVca3xI7gycT
	NDNU7i246qmb5C22aAcDf+HHA/uKJEnnJQ==
X-Received: by 2002:a05:6000:2f85:b0:492:ac00:b3b7 with SMTP id ffacd0b85a97d-492ac00b581mr1607821f8f.27.1793939196573;
        Thu, 05 Nov 2026 20:26:36 -0800 (PST)
Received: from killingmachine ([46.188.59.33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63b6esm1272958f8f.10.2026.11.05.20.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:26:36 -0800 (PST)
Date: Fri, 6 Nov 2026 07:26:34 +0300
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, lars@metafoo.de, vkoul@kernel.org,
	Frank.Li@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: axi-dmac: add reset deassert logic
Message-ID: <au1W-ig2v0WKezj_@killingmachine>
References: <20261105134040.315317-1-s.matsievskiy@yadro.com>
 <auy6rdWmOnxahhB7@SMW015318>
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
In-Reply-To: <auy6rdWmOnxahhB7@SMW015318>

> " sometimes required for ..." is it correct? most likely some SoC require
> a addtional reset for this dma controller.

I'd say, when this controller is used in FPGA, it could be used without the
external reset. In SoC, it almost certainly would be behind the reset
controller.
