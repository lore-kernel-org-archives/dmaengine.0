Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251180;
	b=oxu1aIFmdUJD1Ek5xIOjbGMnzrmgoBuBzPU8MwIbkq6PhbqPMTCxu9vaaff1h8x8+c6/
	 SvS3cFWv1VQpwL6mcyJyDMxB/sQgJHOFQfMXRjowy2lzJQ0VaZGQL0TIawtKH9mgP3mW9
	 gpBl/m8IQ4VR7qRFk+2RFADM23Q+1z1SmvXKdNDlP6n10OyM91Tjlzz8MZ8k3KPsLm3cg
	 T5G+9WxAcnpz67Fk6yditmay8yyO+StBmVrEa/b9KmfcwU7DmGN/ZPQwxiqFRr/FQyad1
	 6c5umJ2KTJykeeyaivhN/O/6OOBhkPeBf3pZfwvFfvzMCa0LuvkSggNz0nlvyrDQkiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=li5d2lfP83FaELH3ZUfaKJF8RdMswZJcZZJT9tiY5Ds=;
	b=b5OHeOdQ6JR2EI1FsQIGBbwTwlrTW82IpVDRtRWWzRhCO2qAB3OkURB/KHqxXCnJqgSy
	 oB/Qhrw2ctk9pBMIyeCqq7jWQbxbtdq+0ie0Q6fsztEKXD2oDNxzo0cmAjr0O1BBRPIQO
	 DMo5FSkSH7DZo76TVfBQfMLti5tvQApR8wPVeg5PtVD6/+xrY/Ofjx4xb0Yjbj4exHsk9
	 n4KkhaCzYkYgCG13wGX8KX5rS+naeGPs1bXvbKcp0XeGZLw2FzmyPlONUEYjL3xyJRmC7
	 R3DKHKCOwaQq0q1pn5yW3RD38tq190fFZSUugJXfyqYPqdlwfRk+miB4P0AIYYeEOzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=DzTk3SoV;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DA8606A326
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 19:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19DA8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=DzTk3SoV
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1093239f8f.1
        for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 11:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794251178; x=1794855978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=li5d2lfP83FaELH3ZUfaKJF8RdMswZJcZZJT9tiY5Ds=;
        b=DzTk3SoVBRaFcDjESOSlDz+HluB5pvDxRqpoAgww6sSmdd7ztACk0SYKoJNXXElEzi
         ECwOk9lzQmIkXUZDisPBU/I3rITknP4L9GV/qOVXGKoIGiQZYdM25oyuzBiqiu3TP0LP
         PSKPrRyrxSUNI4NJupNbxi87jQGw9w2QAgGLQf3sNbi1oPBHAc9nFnHWFA7NqXb1N9pv
         oHakxtaaompDOsaKYA9XD6ftQfsAgYD6Mx1jbHmkNhE9RPjeCYKSm1zhYksnbnA0G7ny
         GLuGN8vJW+lPB+6Qld9RCBsVduTHl9g57S9Upio6p+CdYoZeXn2seSyBMrjqNTAjG5mo
         JFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794251178; x=1794855978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=li5d2lfP83FaELH3ZUfaKJF8RdMswZJcZZJT9tiY5Ds=;
        b=peiP1NoKdoNL9CsLcIqHidxM3SY2ZIuORO8WMh4diQU8OsIupZD1HNAhqd7KQDdwCr
         Y9w6Ja/+6ZJOY/e+7ORr/EiBtRVRpYZ6kHJu6fu4rDEtsZh7lRddfUlE9DbJOhXqJIpQ
         sRpc7g+SuOVBMeQlWyrAdK7MQ3zDYcPrtbq4Y8Wh8bMALBUNrDc8374xJ4jg1ltw4eW5
         03qtFTdXt9lGGJFTttrkfIXJq6RPT/bR6mUgfNS+IdAxA9+A+KYJ/NHMMmRMzyLr3svq
         nEHvAKFZpuOQkBM3asKvBBXpp6QTLT08kxVJyo1if1fIrK2Vc0WEbi5B1mvQ5taD3z5W
         9LQA==
X-Forwarded-Encrypted: i=1; AL+hErGDJXzlpmAm0RytCiLojVK+ujct9D3KPSqeK+6vZQnX3dDrA5yAuYcQ8ol07MSXniM8Coe4vWJyICs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GRcP/wAp9Rrz0DzrZWoeYObbTAMBzdTQq7v+cJL0x/LT2V4nj
	sG0cf17wjYXVjpIznm1FwMQ9V867LEuT4Dlt6ns/rZeavTBhvvM8BadeWBQQa7FUf40=
X-Gm-Gg: AYBFou2RGkp4hnsJrIAMMq0sLoKPg92eckE8QUUopj5UdmVkx7zu2gbFfUR4bOZIegs
	oFqbJ0ImXmmtSb5pGYcA8rJozv+uPtJCof14Lo68wC2fgUrBuM6FzLMSSiRtW7Rcfk16FKdpOO6
	42u0wc/GuucSNo7CBd6wSvBg2QvV26wpVfQm5CZRxxGqI8mRRDSNlJnTao2Ky+McA39GNNpJ0o4
	yA22gHBAv/2aLz5tn7E62phFcwRmqUjHoV91CxxDPwUl5gYf+dNynfhKzZwhnwpyrCQMvkUmHf4
	evAmOjLDKDwSYU/L2/OqzK6AbDsGdHN3hnG7Q5X/CGVt7RaU+5u3eDMx8etSC5CueXKWziFXsYt
	BPJ3yHewy3fLh++Ro/EiPoMgaWfSUbXx3lQdViX4aDEd7JDytn8YSX17Q/i4wWDuziEQ/7STRKp
	aZnb57PAB5AG0VAQI34M90kP2aiO6RzUPPSsN8KnSNa/mBODr3ECiugbpTXbdN4qzcRlONneL4d
	FBDHcEjtxJqFcTdwjooiJDNj8dpOmMV6Oz7+6wh9SKOibYjaPTNG9FM9lEQrEKaRtWLYSKYd1Dx
	VCTWfvIbgEZR+n0qEzLeNLqaEaUQ8WP6b1yTDo2KlNAoqMHxMMkH2SFAxtyxE3A=
X-Received: by 2002:a05:600c:1c1b:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4ba02341314mr3514265e9.6.1794251178564;
        Mon, 09 Nov 2026 11:06:18 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:e834:fd4d:2ecb:b787])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba476sm10178685e9.2.2026.11.09.11.06.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 11:06:18 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Vinod Koul <vkoul@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH] dmaengine: dma-jz4780: Fix NULL dereference in tx_status after terminate
Date: Mon,  9 Nov 2026 20:05:02 +0100
Message-ID: <20261109190502.71581-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023080953.16963-1-olivier@mgcrea.io>
References: <20261023080953.16963-1-olivier@mgcrea.io>
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

Hi Vinod,

On Fri, Oct 23, 2026 at 10:09:53AM +0200, Olivier Louvignes wrote:
> jz4780_dma_terminate_all() sets jzchan->desc to NULL. The cookie of a
> cyclic transfer never completes, so a later jz4780_dma_tx_status() call
> with that cookie finds no descriptor on the channel's lists, takes the
> else branch and reads jzchan->desc->vdesc.tx.cookie through the NULL
> pointer.

Gentle ping on this one. It has Reviewed-by from Paul and Frank, and it
still applies on dmaengine fixes. Without it, closing a playback stream
oopses (trace in the commit message).

Could you take it for fixes?

Thanks,
Olivier
