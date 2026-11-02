Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612742;
	b=U40dSR/7C/AR1oGtFxq227gxl+GmD70XElJQWKEal/Aw17M2HJQycFgNBvi/8cDU+WXl
	 rXIBvu2jeucVHChiB9qUuWe4ce+vojRKcDzGVJS/EWutqYc2XXZlV8of7n0tZ5IQalyKv
	 to/rNYAdMuMXeiboUism+6dQm93dPNYzEpAlatkeObOAjNOuGj72eUm3R3kdjyZJKtvxi
	 rBbEa7oLduObBpgHamaI/0dEKXrD9Flyx5HiUXt6Uph/22CY/K/LVtgd/fsBS50q26kSu
	 sCQxN/ufmDBHc6DYUxNYrFu6wxZCtZwoZcHaen8Rh2gJCFogkp6w+TZcMELqIIfYO3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=91hrC+ps8zug3m9SthpYigfa4E/zchDNBPSUwZvkGJM=;
	b=MetLLvcWf4l7V7ef/b6/VRrictj09YUa1pKTkGZY40TDxwtpExlFP5HXWgAS93JCtKnQ
	 F6S469dZND/kVSPCWlXkzmYWNaXX37djgvQzsbTbm1qS3GaQTmtlL4ndrwnVPiUCXhKxL
	 WUAtRy7LsglVZH2kRZfds5100F60PwSdGGRQ40Tez8MU4Mq1TZl8WivMEGyVlViuRuESK
	 XhYoEmZGijXXFvNHA90km6qaVgcwjRVtPQ4DnIz7OMG8gqwQ2PdK4RIdY0bPFf2OJ920+
	 Sims/TyQFwAatkjsGj7y+384XtQf+aBCkZ6awonF+4WNXxvvT/vjTrN9Qz7hbDAPK9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OI6TnrpY;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ED9606A324
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 09:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03ED9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OI6TnrpY
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4cdc606b47so83606366b.0
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 01:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793612740; x=1794217540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=91hrC+ps8zug3m9SthpYigfa4E/zchDNBPSUwZvkGJM=;
        b=OI6TnrpYqG7qyy3J6+90wx0M38+qvWLpSIbBI86J0zBkW1gHrtNRBmlHQWdm4Afr2R
         YKCtGbkurXgX5p7REF07zQXuFAzBbii619u7sNSUEeR2kluxciptjnG2LX3D0NiA1cxW
         uhY6RrhoEblu24TVFKnAnGZUVhsHvrEp3SLzrMjBAzjzt3UDZauR5hrLyeGrS+VNQObN
         fz82jhA3hV7cNvfYy4Z7D4OXkOkvppgiuR/rXENPSSR4sOQvfwTgwtbp3qZSvELJz5fo
         AI1QRiyz2Adi7n156pOReiQ5Kye/gnkY1YNl0ZhMOR/dMaFWjiC80MbFpN0ncFDEQbRM
         RWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612740; x=1794217540;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91hrC+ps8zug3m9SthpYigfa4E/zchDNBPSUwZvkGJM=;
        b=zqXPhua6Z8A6AcGd41qqKqllURydc0AaO0DiPltWZUe9PG+A36V5tn7VfFDjbxkxor
         +a+610rwOXoOX4gfoNKAYns94jNiuxUE/j9SW6ug0EDVP+UApEF3yad/4yj822QlfXH6
         sJCu9969xOzkE1q1vxFOAplLoEQx8IpTBQ/8lxX/LP8CSP5ebKbi13ezYCi5k3mHkxhF
         v3WVzJu2xu+Jfwi9FvfOQ6GatSeKEuaukVFTMK4Q4yAY6fqyNW2UMn+2EEDoitow0y7P
         0NH+RfWkbo1Du5omRntGjiFKPMmPR+GdAI4S9iNVML8edq5MnxWg2+0/66nUWUtjndo1
         mUuw==
X-Forwarded-Encrypted: i=1; AKwUvBzh2GtnlibwetQhwTWt48mr1It5rBsNPO19C0WkkaMFsOOAMjEgrfujWQ8TodWe2Jq4ND2+pwemevs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcabrIJcYAZBonviXL7AO7h9C2DAY8Zz+5lReSRaIzIP0vs5ir
	ZFi5kUWyeUNotIzFF8BoP11cWWDStjadU0B18bXemOI8uozONSRGQ7Bo
X-Gm-Gg: AYBFou1z/YGsBBlDSqqw536ohgDHvadvBLcOt02R2gd3DbTXua+AMRbU+mufm4l85NP
	U18w86aHJY9wyx7+1sfAQL+XndZRyc/ImRc7Jce7bjYaEPWAHbeXykikobAx9h2/BZhqSTvc05u
	nKNmb2OTRtEWBYydGU7X8S8acb5ar7iXno/jmj2v3dHqCd/JO1bGSJ7wiEiqYs5F8VA4f2BGMZ2
	g40tlQyXfGPTLcoRuGyOnpFnJ1kGMmJGZgzALbOLgs8BhJJjn5qo2GrhjbDAmbWdDhbOY8N9RL4
	Bs9hJfXriiAA4u+c+m5Fe3cPlGF1m8dTZihyhyXKNsI18NZU8ldFye6nm+CmlnFr7TDF2+xiJCV
	+/xi4/JEDuKbY2VgxNb2t/mC+PjuiAM3vw5cLa4VbhC3j5RCRmaMolGvOf+sUOYxeiQ0NGFXCMm
	RYNzzlgtn6sCAEwSR5FmrCsqcE+OU8LIYChP3KKuUrh1ZcWM6oEMLSWH2ibtRiZ6cJAsA6LpWdr
	Zmu/JvnC1kabCBK0YPdSWVVQYfQLaZRB4wK4MR5hn/I+sbQ5zH/DkFIqS1vyxnfzvt1McSHxoHJ
	PdZmQYSsZmXvDrhj17dmrhW3v5RUc7p4Pb10uBrD3AkHRFC/lgFwWfzm9m5G8HUHVYHnFhW5GTE
	VA7ky65kmIF8tOxHBTbxrhmXB2urRosuX9zYOiSn1uht0
X-Received: by 2002:a17:907:6e93:b0:c46:7ec3:fde7 with SMTP id a640c23a62f3a-c4ca7aac4e2mr783350066b.31.1793612740250;
        Mon, 02 Nov 2026 01:45:40 -0800 (PST)
Received: from [192.168.1.229] (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc174d0sm369796766b.4.2026.11.02.01.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:45:39 -0800 (PST)
Message-ID: <03f2dae1-453b-42ce-a3fa-e444906bb1bc@gmail.com>
Date: Mon, 2 Nov 2026 10:45:38 +0100
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: apple-admac: Fix position one period ahead at
 period boundary
From: Jacob Procee <sn125164@gmail.com>
To: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029105908.22809-1-sn125164@gmail.com>
 <E5478149-FA00-4A41-8CAC-7E8CF8578473@cutebit.org>
 <80246e46-8b9b-4cc8-b3a0-b07f9e5aaf8f@gmail.com>
Content-Language: en-US
In-Reply-To: <80246e46-8b9b-4cc8-b3a0-b07f9e5aaf8f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/26 08:35, Jacob Procee wrote:
> Thanks for the ack and the extra background info. I would love to take a
> look at a race-free version of admac_cyclic_read_residue() as a separate
> follow-up patch; v2 of this fix follows shortly.
Hello Martin,

I looked into this using REG_DESC_RING. It only contains descriptors
that the hardware hasn't fetched yet, and its read slot is effectively
the hardware's fetch pointer.

Unfortunately, it isn't updated atomically with the residue reload
either. Across 1.49 M reads, I hit 126 period boundaries. In 4 cases,
DESC_RING still showed the old state even though the residue had already
reloaded. In another case, DESC_RING had advanced while the residue was
still 0 and no report had been posted. So I don't see a way to get a
consistent, retry-free read from these registers.

One could make the retry check more comprehensive by using three
counters: outstanding = queued + playing + reported, with playing being
1 unless the residue is 0. This would also catch the reverse ordering,
where the report is posted after the descriptor is loaded, which the v2
check doesn't cover.

However, I left the debug module running overnight (10.65 h, with music
playing through the speakers), and never observed that reverse ordering.
There were no XRuns or backward steps. The speaker channel had 96.6 M
reads and 15,483 boundary hits; the second channel had 29.3 M reads and
86 hits.

All 1,498 snapshots that failed the three-counter check were explained
by read skew: 822 where DESC_RING was read before the fetch while the
residue was already full, and 676 where it was read after the fetch
while the residue was still 0. The positions returned to ALSA never
stepped backwards.

Given that the more complicated check would only handle a case I haven't
observed, I'd prefer to stick with the simpler v2 retry.

Unless you know something about the hardware ordering that these traces
wouldn't show, I'd prefer to stick with the simpler v2 retry.

Kind regards,
Jacob
