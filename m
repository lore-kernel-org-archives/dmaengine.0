Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52FD355F42
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 17:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158966; cv=none; b=js10zRhoAyDiENAHlWPq4aegaH8AoElXh2A46qJ/j2mpzNGKNI9KNKed8nf+9yJnJh3xp3bW2F9IvqK7tg6TFW4mhnsD9qnEbUkYyhUYc3GzqLSo1BZ6tTWf3QqVgvMgWw49ZTYy92IvMjjpGAXPI0rNRym25AeBHXfRcuPcO/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158966; c=relaxed/simple;
	bh=y/tgLKqrC6N9VBD/B7kiBR2V1ZSUl6FiiRqNy8QGX3c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Qr6dLv3Hq1ZPJCIEI0tMGyI7k2nkphhlDI2fMs73zFmj00RToR1bst74qt5iMpLBvYifwBsjfz4oAurlfJwKk+zIgdo7dnUODNdzzxwQ0w3DsCMoNK4LQz2ZwwqRm5enpGa5nbGiVdq+VUMyhnd7mxKcYl8Z1Vr2s2NQ9VDTDTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gh/taW9F; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gh/taW9F"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1677229a91.3
        for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 10:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787158965; x=1787763765; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y/tgLKqrC6N9VBD/B7kiBR2V1ZSUl6FiiRqNy8QGX3c=;
        b=Gh/taW9F5aB2vZFRwqvxvjI4/qVCAzIznNHGdG4t/geZkM+7sfUUoBmr9k/DalCnOV
         K6B37MU5wm445bNp4k7mYRTfqd79trjyPI7uhfPhddX9TY1NrIwsvinsOMpbwga+9hDh
         k9Hc+7HgGqN8x0WHpN/EfkOUxOw86pQ6RsAlDmVWSPQW34i0W1GMFmVFcUUh2pnHrQlF
         tdRimv3C6VmXZsj72mwzjgH86Fx9iL0WsurRLqrPJoDCUNJ0L5d1wNxaTomCc++SGuJl
         FxyCFWOj0M3wRtW7Ed0MyRshLMgCOhe5l5zX2hwQu1YlMarGLG8BEQKp4VT3LuDeKW7n
         NUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158965; x=1787763765;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/tgLKqrC6N9VBD/B7kiBR2V1ZSUl6FiiRqNy8QGX3c=;
        b=tMkbIj++vx/M0fc6D2mbVGABovbxcLWQTNJ7V+s+rnakmq3O0Bloru4dq7rOUUvWWq
         aw/Gd6Z/SOWQwBAyDyJtJ6/JFkePMh3eRDqCmCNbqiqcg9fNvNaJIROKQ4xgNCczjSqO
         vBZFUJWlGJYQLXpvPmMT5rTGI7A1CC7GNe1Z7VcXXZy4oCxlz2Wi0Itnimcm3m9Wn+yP
         Xs/t7hOLfYo1dK3OIYG/Il1jGF6Fqf0y1c97kroGYDgR8HLWmDNTcsHmfZAVP57pbwrA
         e6yLpsHqujkYJFb00WNshoYo15nSrO7cdweCN/9Sa12TDYT0PVaTZ+Xn4TNMqKwqFBuU
         WKSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCkSd4eb5ipsLCNYjbcEYvWTzCzQ7O2MgXJMve5RMscaxsD1IC/Gv+NLlLaRcbcyZUU+c6s/kfqX8=@vger.kernel.org
X-Gm-Message-State: AFuF++nqPV/r80BE5tre0GjFyrdzTJX2zwv8EUJ6sDhzRoSBgLZG7rR9
	uybno1m3RgKyPdB647UwRmw0uh+JFtewSdvs7ThdPpP+iDXZKpuPaET35IGXzF4/
X-Gm-Gg: AR+sD12k+GiJ/vyYgFYwKD8HNfc6WUoo7rrF2gl9GSaVl72uUef5OFh6JJO7c2Q8JKs
	4PxteONdaaEpqQVIfRQ8m27fcjJDI1ZEscQlJFEgs6U2LrVhtTLKtpMfvIWcc57ASsO5o5WtEnV
	Y6Xm0TuSLYEFbD3Y9CxSrOjD50eYeIqo3NH1qSuNVcg92dcwTIK/3cJk958hvo86OZDfJkTDVuC
	N0WR6OM9p0vX+/xuPpHpdM6Ctw89itWxn8M9rvZivKqDQdNOoYw0Rvs7CioHEGU2UqJGhwhlAGL
	sbzY+KrdYQKXSXeinTh0Wq4Jl3QpItBUM66MzSSKXW6JcLoB+5Zx+k2Mn0Mde83pa5evUutt2Gl
	RGDK18sIGuYWCpTF3/kKYWno4kQQu70bu4s0KDnP+ZdqywWW6064lfE29JbOIycykPwdgpLpiFV
	PY0zqMHJvUowe5ZQvHcvcyJDd6uSirBYFfijWaAo9bU3KLArOSFlxfEddUBJyZKSgvfg8Bdw==
X-Received: by 2002:a17:90b:2f06:b0:38e:7f1b:efa with SMTP id 98e67ed59e1d1-39581211e02mr12083624a91.11.1787158964962;
        Wed, 19 Aug 2026 10:02:44 -0700 (PDT)
Received: from localhost ([2400:adc1:447:6d00:6351:4475:eeb9:18f1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10ca5csm8610734eec.17.2026.08.19.10.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 10:02:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 22:02:30 +0500
Message-Id: <DKT2Z3VCNO33.3NA1WH85G460B@gmail.com>
Cc: "Binbin Zhou" <zhoubinbin@loongson.cn>, "Keguang Zhang"
 <keguang.zhang@gmail.com>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, <linux-mips@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] dmaengine: loongson1-apb-dma: avoid using iterator
 variable after list_for_each_entry()
From: "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>
To: "Frank Li" <Frank.li@oss.nxp.com>, "Mahad Ibrahim"
 <mahad.ibrahim.dev@gmail.com>
X-Mailer: aerc 0.22.0
References: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com>
 <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>
 <an9teadkgwUsmMnQ@lizhi-Precision-Tower-5810>
 <735044e7-07e8-462e-b94f-4fea1b5b1838@loongson.cn>
 <DKT0L6TUJDS0.1USKEHYON3OZJ@gmail.com> <aoXNqDisf6NPAbdR@SMW015318>
In-Reply-To: <aoXNqDisf6NPAbdR@SMW015318>

On Wed Aug 19, 2026 at 8:37 PM PKT, Frank Li wrote:
>
> You missed their tags in this version. And avoid post new patch at old
> thread
>
> Frank
>

I don't quite follow what you mean by the missing tags; Keguang sent his
Reviewed-by and Tested-by tags two days after my v2. I think sending v2 on
old v1 thread is causing issues about the sequence, sorry about that.

If you wish I can send a v3 with Keguang's tags and a fresh thread.

Thank you for your time,
Mahad Ibrahim
