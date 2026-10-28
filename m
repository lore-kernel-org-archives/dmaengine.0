Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219048;
	b=uP0/aWMa6SHc9y7/0EdyVi4o5D4JaDoy8B7YHiceaiiwiBvKe44HJlZgyIlX3QceAobV
	 anL3G0wsegxNrsK0dC3bApofrFKNzvsU+Csi3IpOK6shh1vA7hW8Hxn3RVgEYIlWwAvQP
	 QFbymCsAQ7jKFmWx4nplqsQsF+HvxAB45ZYbWqaCKSwmzaH1kzSU7iuvIfwDwJZB+XWqT
	 xAMzIZ6b6EET08VbOaHhF5ejmoIpQaxgx1Zwt7OoFHgWo3Y10bMYtivN9VndDtQY9aDr5
	 BJg2qKgktn8ZGkAruZROC00e2PsicIDbDrgQAQZlhW1pQHEkfTQXMf5DYu0fG6hNYPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5lS3F0Cpg++YyxcvMj5RtcnTaD4p5NTHQ0SzmxT4UpE=;
	b=xeWyD2ksvkYwYAarM09KmhNjU53JslgiNeoenCPeXbVllJUxlhMbsOcgqt/Brqb/fLGa
	 y9kZE3maZYONDmAfGNeJWMtCBjbD2S7KnN1Qx/SOeDMyoeDTI0Qf/IrzGbfzokzBp/foc
	 qUj2uoJ4OZJPBrEpvx938QuOj2uoWLJ4d3wxyaY2Hc/Bb3oEJLPHHR9csEpc8wyv5JLpJ
	 zVXrMXUk020Jk0izJolXpFItjt8c16KKIU/4w1bTFwm9ZNXGH3PCH279A5EI2abWGcv28
	 5yqvdu8ScBXJWr50wSKka6keeaIV5CaXpTINsqyqGeZGsfZnJA53qETvuaRzKpqV4gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11F7606A32C
	for <dmaengine@vger.kernel.org>; Wed, 28 Oct 2026 20:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D11F7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so13877965e9.2
        for <dmaengine@vger.kernel.org>; Wed, 28 Oct 2026 13:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793219045; x=1793823845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5lS3F0Cpg++YyxcvMj5RtcnTaD4p5NTHQ0SzmxT4UpE=;
        b=apIzO/FLOIPEPyIQkW/EQOtJrZIBvmNI7vSesQpObzJ/kDpba9EGoD4T0k5TLlc181
         0kXlmFAp56SVfPFL1kLdPKR4f2B+BRrUslAmh3XfWufk1Fz0R8M1IJCBxkhHREtkD+WG
         LCdDG8bhnGcuRLHKtA8Y12TW8DcnlEZwaJtoYDyddQoafRj8VPtbu2HI9HSl+jTMo6L3
         4mrmKgltCTm4etvn4GMrOmZfhQXwtmk4GdiyOmA2LoD32RcIM+ruzwDhNDTv51XJ3VJI
         /PsQsjLABk+gmp0wznLa0iM8ZKncdgktyGSTwKEYlLe8CgK4cEc+8ZA0gSjh9Kwp++jl
         2fIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793219045; x=1793823845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5lS3F0Cpg++YyxcvMj5RtcnTaD4p5NTHQ0SzmxT4UpE=;
        b=e3HAicvrCgnWLkJlMdMZu9jROSFQzc2CqzBihiUOvv5Y4JmyxYS79DY4fjVbZMNLMO
         nD0wHpKJTBRshRfD2Kf0lfGLNr50cQUA39KwjUgM5QLMeKoVdNMAwrzZlVqdkn/VqgSd
         lHXPdFNYgWnZpziRp71oT5dm8fzyIkMgyPsYNLw52/EyI3vdKVEMwXtFmRVRheTNXjsq
         idPZAI0BQz5YZOvzsO5NmAz9ESXYasqmmWg+SyjKIdv29bUFkD/3ugtaZoeRWlfEWfSR
         VbdEP1sYCDLIukwTHa9jzRIEXYQTZv9vnj+xWRCyGMXpUKGhfNF4XF7OWqbcJ58vcf11
         JWKw==
X-Forwarded-Encrypted: i=1; AKwUvBxR+4eb7B2sRAK37WMeeNrbEuYnZZkuNA2WHXCWQwayr0/6FjR9nbjDUCYJmtQMlkMkxqMbHCm4YkU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyYgqI3HZkb/NznkqUol2E22Pz+r4Z5NgIv1y+EoyprVriYZqt
	0qK8mgX4WHQNUmvkOInmTHmjJMvYAcb9hXTtjU5tTdc/FWyFveH0ZiJgAsnFWWHBmwc=
X-Gm-Gg: AYBFou3VFXWUAhedqaNgnk/3HrwILI/2WIYr4E7nZg/l9vPFrsFRtg71v4zVspKd0rK
	kExXPj3bH8uQ/WG4jPfAgE2qo2RKCF3yYzud12jAG7lHZOxPAXp1wq2IpVP/iixpGPsVAxP4acR
	39aBouggafUC/iDGKjnEU518MByTJ+CwgR3h9KPWMhHux4ks75EjHQj6je047jBhlzHFZiMsp+C
	BaArLXsVSl342qWlTkigR1mPPuVOqguBW+y8Zk3qg+LI1vD5+EtlNqrcOms5bYnuEmulXCej88/
	fPUM4VOQOsrHxVMa/8qnsPbqjPRuu76seZO841R1JXHFcowedBLCp0aExnKCO95VTuu3PsnqeIU
	xSt536ZXsXZhyV/NEP/xsywHyqegLGHerjFPOG9sklHzTwiOqe7sKscneaO3YGGr5VhWwmbV7UE
	thLQWnc8XzWQMowT15krb1KgDnbaydxNQgMKbuj2bmGBtsu4nnsnoMGViugRdWvBj+1vfD4B7OD
	IOf74vyBhAl+PRIYkQgBMbem2bebDCJFWVJyTfuyN5QyVW1suX0vSXB0ML6M2GNvtOSH4YMnCKI
	NlYorVlvZkj8pctE/0QpFDFLFQrj6AxI06w6wL321F8kzPxI+9QTkxZmmqaerfyYdIidY9vbluO
	s2vTDlZR5Zn22hw1YUKDCqTgbUqQlnHLK
X-Received: by 2002:a05:600c:350b:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4a966c41721mr72974675e9.20.1793219045017;
        Wed, 28 Oct 2026 13:24:05 -0700 (PDT)
Received: from irdv-jinli.dev.purestorage.com ([208.88.158.129])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7ee57589sm17498015e9.2.2026.10.28.13.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:24:04 -0700 (PDT)
From: Jingyi Li <jinli@purestorage.com>
To: vinicius.gomes@intel.com
Cc: steve.wahl@hpe.com,
	dave.jiang@intel.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	fenghuay@nvidia.com,
	xueshuai@linux.alibaba.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jingyi Li <jinli@purestorage.com>
Subject: Re: [PATCH 0/6] dmaengine: idxd: More error handling fixes
Date: Wed, 28 Oct 2026 20:24:00 +0000
Message-ID: <20261028202400.1144290-1-jinli@purestorage.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
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

Hi Vinicius,

We hit the bug fixed by 1/6 and 2/6 in a kdump crash kernel on
systems with DSA: idxd probe fails at device reset ("Device is
HALTED!"), the error path oopses in destroy_workqueue() on a NULL
idxd->wq, and no dump is saved. With slub_debug, the duplicate frees
in idxd_free() are also reported.

Testing: I applied patches 1-3 of this series on top of 6.18.57 and
tested on 10 systems with DSA, triggering kdump with idxd loaded in
the crash kernel, with and without slub_debug=FZPU. Unpatched: 10/10
oopses in destroy_workqueue(), 0/10 dumps saved. With patches 1-3:
10/10 dumps saved in both configurations, no oopses, warnings or
slub reports.

The failure here is at device reset, before idxd_setup_internals(),
so it exercises 1/6 and the idxd_free() part of 2/6; for 3/6 it only
shows no regression on this path.

Could 1-3 carry Cc: stable? The commits named in the Fixes: tags have
been backported to stable kernels (we hit this on 6.18.57). Also,
from reading the code, 1/6 alone only covers the case where idxd->wq
was never allocated: with only 1/6, a failure after
idxd_setup_internals() still destroys the wq twice (once in the
unwind, once in the release callback), which 3/6 fixes by removing
the early destroy. So 1/6 and 3/6 should be backported together.
(Our kdump failure doesn't reach that path, so I haven't reproduced
it.)

For patches 1-3:
Tested-by: Jingyi Li <jinli@purestorage.com>

I sent an overlapping series [2] before finding this one; I've asked
for it to be dropped in favor of this.

[2] https://lore.kernel.org/r/20261028003708.834341-1-jinli@purestorage.com

Thanks,
Jingyi
