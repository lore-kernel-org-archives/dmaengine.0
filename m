Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886927;
	b=HY7EECJOFCDEjbTMNNYp0bzm5IgWIzgud0b5A19DLNAKo2X4OSn9xZ/GXxoj8W49iTRQ
	 smTkwf3HO8gs/1RmG1pkJnGkiRkBWnBq9M0JhXVCuSp4rTwfJtnbwmJ78b5t29Fcg/M9b
	 QxqE46c7dysbQO/QgHiJf5G/kH1jJVlIXarLKkVCMvUpklKlloLayn/lQek1wPlaTBedH
	 kOAgtHsfe+tyC9BZUU5nw7EMj4/+0+WbFyIJgijYXHh/S/NCs3Y+/4BA2sPgn52WznfZ0
	 LCKulK9mkxztl+7ZqU9xs/DD7mXBPwkYgEaPFMeEoZ64HOVFxn3+GoSTaotsk3iUUzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ZOan7uVPwS+Sq0zaneJfTrgsA8Jqv1vwKBJC+yJr4FA=;
	b=xRemORdiMwRhxbeQw6sGDyAsR8ROE+Qp0Q3EeIzRTXfJEwGIqguSKVJ2fgWaY+ghUbkl
	 70Xj71uStelGgCJEU4yu6ymZF9Z64JIc6IHh1/If2Xe2NeW4l5AFJZUHClWHSVcTH39nP
	 /Sw9ykwbozlHT9HOhGeJwSXezmE1DqXiWYaYCzMLLsk8xutB/0095sSbuA3nW/kID8/J7
	 1i1hLeb0LN3Bx7kVSR95n4AgUeudiH0iRf4sfyhwPZtS7K0NByT/hKXTsUltFGN/kj10j
	 3edxwVIYVZ1tCXd6l//c9s2O2ctpZpTmSkMRKkeMJYRTV1UwhriNUMtTX0EjwSLxRlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kj3FRHjq;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFB3606A326
	for <dmaengine@vger.kernel.org>; Thu,  5 Nov 2026 13:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECFB3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kj3FRHjq
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so16538125e9.3
        for <dmaengine@vger.kernel.org>; Thu, 05 Nov 2026 05:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793886925; x=1794491725; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZOan7uVPwS+Sq0zaneJfTrgsA8Jqv1vwKBJC+yJr4FA=;
        b=Kj3FRHjq0kS/QTeHwpyO8VCSgN6xpI7T6ctPjb4MUWfs7l/H4yrVwZEhVC6L3tlMkH
         250J55XIf2giNP4eWE51mfyODlexkBd5EkK7AL3V1jh1b3qYq0c0qFv8y2BJL11o+JVw
         ekwvqeobN8QF3k9/c8nX76JCktawT4ZcBnaHhWBp1JWUJ7iEl5BKtzlo6YlKOi8XUBUy
         71KghEP3YOkymNlnZhxugnO/dJ6sXS9jyCKb4cOI7Wwenk+pjthuWACtBWIjtIBEntUg
         tadnLar0JoQNTHrhW5FJ5uI7sQs1iVaF++07p/NPQuHMBqHcNwibPXsZwxCFF9VUZS97
         7aOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886925; x=1794491725;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOan7uVPwS+Sq0zaneJfTrgsA8Jqv1vwKBJC+yJr4FA=;
        b=oR19wLKg2rHffjYb/w2Ld30CoF6vY7E2HUSqwuknD7G8ez3NYZFxpEpyCVw+grIB0p
         AzQOPhy4ru6eg0l0Gxbm/apVnMW7KcbToaLZFu/dnDazwCPRZ8TPa6MTuV8hs7yAZIxy
         wRIgUyOD/wL4aGd2ia/CUsjT1FyXAzlTtwWvRXQq151Nj0WkhZ1ZUYgw8E7v/T8TGEB+
         9oZeRE2oNmF8wduxsdrNk2296HuvnHnuMvTsHsC9HJ3vv8Z5iMiWguQ0RJCd+JFRMX9I
         K30XzOIST5UiGiRfkUYHuytRX4ihF6FMYf7fe7noHD+nvmKBQ4TxQ2xmyqTkqc/2WivS
         tFCg==
X-Gm-Message-State: APuU4Z8CkiWm7Bj06YWoO2KTSgHgWSBYKuv++uMLLfhJiHLHfiACfGxN
	sDEkJD0NqXjNdbimg5EvL3euAmZ7cEnoMpkZiuVNOta+eHcIMAj2a5y5
X-Gm-Gg: AYBFou304rkp9+X5zMVtWLUpvcziQtXBtIAuuZNZ0OrELfVipd7x68s6XdLao9rfG4t
	NAsqojer1sRdj2SHL8/k+HtfKfMmr4feACuWRRD7oi8eepQOFgkRwMKIHdWGQeCY8ze6B3B9ZRE
	R/Hwj2p1fJosNlV9z0Rf3OxgkSWCIP7PmSjNDQIxoqSIG1S1CeElKGpvCvxCBeiddFqgQNdvcpj
	jFcsyshYR+anLzCr28PZdyYHWDAlG7/ITZUyK3afI1Ch9rj/w3SmuvXDA1hkKBkIu0cd8jVDoAm
	JvAv3Rx4Bv63uZSrKJ10E8KO2hRr1YxILEK/N5LHpf68pFW+6EuJmb3VPUIePQXnk1qLrRJc861
	Xoh4q6iSfd3JGO7ALWs28QdFGUYt0qYVVGIeT06yyT9xDcWlXpNqVTzibvWMN/ZVC/MQlmVDjUc
	3XqeqwzCDsdl1Z2CFdiDLsXhCtbrnC3VcZZ1UlsdSLqTBPf8MJ7sR+hyuyYQbfkQWIE3vr6CR4P
	hx0Swu1GcsK6V0eG46BqoNoP75v0lYSrISKG4P9zBILgB0fnNPdklYIh2ysbOhEtvBvkYfeaaix
	h4iuaglSKNQZbpl02Ngqi7FpDqxxyPvhmg==
X-Received: by 2002:a05:600c:811a:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4ac187a6b30mr413265455e9.28.1793886925187;
        Thu, 05 Nov 2026 05:55:25 -0800 (PST)
Received: from killingmachine ([46.188.59.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm76604845e9.11.2026.11.05.05.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:55:24 -0800 (PST)
Date: Thu, 5 Nov 2026 16:55:23 +0300
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH] dmaengine: axi-dmac: fix incorrect segment size
 calculation
Message-ID: <auyKylfYyK9-pHKJ@killingmachine>
References: <20261105131547.305510-1-matsievskiysv@gmail.com>
 <sashiko-outbox-199139@kernel.org>
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
In-Reply-To: <sashiko-outbox-199139@kernel.org>

On Thu, Nov 05, 2026 at 01:26:06PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] dmaengine: axi-dmac: 32-bit overflow in axi_dmac_prep_slave_sg()

I don't think that this warning is applicable. Both arguments are 32 bit
integers and the result of the division should also fit into 32
bits. Intermediate promotion to 64 bit integers should not have negative side
effects.
