Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D92644C659
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 15:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152234; cv=none; b=c3ssP0OxSiJesjNqOdtriwHPLxyea+4R+LEwSfBtKh+42gRG/2nmt6/6RYowDrfoLuWl2rqxcdtkZeA56Kd0JX0BKpr3SgiFU9346ghnlSVV5ZgmEeN24Gdw6jCmpxd9RkQy18soYjEkcfD+oPwnn6UfKKDtFxbzagOvb4eJZHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152234; c=relaxed/simple;
	bh=mlFiUKgQggRMc/OJyKurQ3JWwmAPn39IOAT8jFs7Tvw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=FCuqfq/VlC2EqGUl9C54ZfVwmlupxmD+w9g1T38Q7Kc87+RXK5Wr80u9yNKKTu0uvEfuASG/2MebrOdUXhi9ziv7an0kOvoDQ7B0NuMBH+52CKnrgCildgGgAGoyB7WZt4RxjTbpLaNsTLQY7cAWTkMyoCeVRLtQJSxqU6yVI5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCMM31UA; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCMM31UA"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3900e39d935so1245312a91.0
        for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 08:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787152233; x=1787757033; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mlFiUKgQggRMc/OJyKurQ3JWwmAPn39IOAT8jFs7Tvw=;
        b=HCMM31UAdZtkV4lCYfQPG91MlQD3JC5ygdsWXopnaPmbdzw8X55S31yEK7vCyyy2MG
         PGrdUCmTyXVh74Qd88Hkxd2Pp8DKB6OU/QhWuFpeukGM3Zni5W4sfl7JVlMRa9HjPouf
         mIktF+LfuihTc7baRQjQrKtuMJkuDaoT7q3no0/IyyeYBb5pzRXNLrt10B4XH2hrHMAR
         6h6P12dpiYT5I7LFHLNo94/mbLSAcnyTwTfwJBdexq0DbpkJflop0MqAqVERiaQ3SHCV
         Socffc6Io3Ojb37VEO0CW03UDJubFLoGdyfdwQ/zD4YfpQwDuc/2G3k0xjmQ8/1mVVOS
         Oqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152233; x=1787757033;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mlFiUKgQggRMc/OJyKurQ3JWwmAPn39IOAT8jFs7Tvw=;
        b=oORl2TLAruwsv0r3qAK+B+1bpn4Ks0L7gxse3ujoBZI7XA9qcHAiStK4UbfKqnfGpm
         6rRJyuZbEu3vWFAhE/9MSDU83yI89dFpdZ4CGiC4R18rKh4sfja3uxi0LMN8NYjzrO+C
         UbN7Y5bUt3OWmZjHgyAGx8LvE/LFsh41ge5sKe2ak/diVlang3twsd/dpEmBdo1VvOXY
         SOf+XpLNMrcmAfHK7Mmith/Gj/fIvReaCI9k4oj5OvzYH/NDqwvEi//SzzAWBR8vEJNn
         T1XzNBBXr/4TWSsgMqly4SeFRlJXa5gJyKLYXSFiVDz+2E70rRENe5eeUF/iuNAxl2hL
         yz6w==
X-Forwarded-Encrypted: i=1; AHgh+Rqp/3SmuzJd+Y8twKy/g5Ri5D+IKHfnAW0JkHOLPW2qDbqVNOZediKf2prpt5t7PFkb5a+MRlmKG6I=@vger.kernel.org
X-Gm-Message-State: AFuF++nmsgw7szQF5GgRRu6AZ+U4wUaqUpHy9/LXvhDajWn+/Bk9hX01
	i+d9qI/GHXNTQX8VIBqYKcM79AdYR1JwsfnQ9nR3+DFvggnIZvPG0Gd2
X-Gm-Gg: AR+sD10hPqj5uS9FRspkP2vQ9QitfKe/BSsLqgFP0bbNM47TVSMDx7tym747xUvzuF4
	zZqDL559Bv5HnuizjykHruqLuwNtXGmWLVTAu+zJ9Offd/HusKBJWVk5axL21I3iwAjC75Z+6Wg
	WRC/Wu3jFbfz0WWfJJyoxwwMU3S08neyQVGXwY/b7x8GN2WTHXtFiFZu+uw55TPdbldpH7IFrgT
	ieP5BjUt4am8eOoKkf9vn6uI2uuf48Ol0FbK2jHFJC+xDe07i+nl9sqs+LnLYbGPPGbMYQ2mo2Y
	3taIk7whTtPQ+pBM3s5P7sq1MbVuY/KJWY9XKbrkb64YvD21csqbPOud0tJNZs51cnFvHtuaFEc
	r2ssbbJ1UQF6oJZTMJ/eGvCkcfiEh5tUg3RdMQxKyZtDA+nU6iJAoBg1aaxKMcopvIZ4ugBDBx6
	jj6xoLYhYZ0Ja+w6uYYwE1D7R3lfnG8RLiyyEARNMnP9vji5wMJY8kGzLL+1RtSLZUf0os4w==
X-Received: by 2002:a17:90b:544f:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39580f0943emr10846765a91.5.1787152232706;
        Wed, 19 Aug 2026 08:10:32 -0700 (PDT)
Received: from localhost ([2400:adc1:447:6d00:6351:4475:eeb9:18f1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm7189580c88.12.2026.08.19.08.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:10:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 20:10:18 +0500
Message-Id: <DKT0L6TUJDS0.1USKEHYON3OZJ@gmail.com>
Subject: Re: [PATCH v2] dmaengine: loongson1-apb-dma: avoid using iterator
 variable after list_for_each_entry()
From: "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>
To: "Binbin Zhou" <zhoubinbin@loongson.cn>, "Frank Li"
 <Frank.li@oss.nxp.com>, "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>
Cc: "Keguang Zhang" <keguang.zhang@gmail.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Frank Li" <Frank.Li@kernel.org>,
 <linux-mips@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com>
 <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>
 <an9teadkgwUsmMnQ@lizhi-Precision-Tower-5810>
 <735044e7-07e8-462e-b94f-4fea1b5b1838@loongson.cn>
In-Reply-To: <735044e7-07e8-462e-b94f-4fea1b5b1838@loongson.cn>

On Mon Aug 17, 2026 at 7:07 AM PKT, Binbin Zhou wrote:
> Emm, sorry, I don't have any test equipment available right now. As far=
=20
> as I know, Keguang is the maintainer of this driver, and he has the=20
> necessary test equipment.

I apologize for the late reply Frank and Binbin.

This patch has already been tested and reviewed by Keguang Zhang who is
the maintainer for this driver. v2 was based on his suggestion.

Link:
https://lore.kernel.org/all/CAJhJPsUmpie6NkrzuTK-8C4NP2FFKQMG3nY8626_C9Qjdu=
4M0g@mail.gmail.com/

Thank you for your time,
Mahad Ibrahim
