Received: from mail-qv2-f40.google.com (mail-qv2-f40.google.com [74.125.230.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C6B456E00
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 07:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544320; cv=pass; b=qKYxM91AwlxFy3qniAZs2AN5uP7bXBW5pw68VfH+fd0kI5b06UT7j+81/sjQYHKxZoC6pwrXHyIBqY9dkfgiLxW6CylFvj6DSRr+WAJxUFrcSbOkspkwn2fOp3KQTcEd6yWlKapCfJXPNgN9ECq3pAKarDRqpOpqk2yNGCgTY8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544320; c=relaxed/simple;
	bh=hQYBSbI5ZDykG/tHrbEEtWawqAnT4ZwcW8GfIYLRIEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b2BS6HzInlEhU+4MDIApqynMReKFE64Bd8Igq58yY5vmZSAYjBjY62ipxaSjPSzeqgsx05+R2ucG7GFsYZiBz0nrHaY7SRdIvqzzOrZAESqY82Kf5pyUwl7+vyvnIP086cSAv3nB5GI5IZOXPwyfGq2Vy2/Iib/Z2j8oOJ6Ra5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=b32oWsj1; arc=pass smtp.client-ip=74.125.230.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="b32oWsj1"
Received: by mail-qv2-f40.google.com with SMTP id 6a1803df08f44-90cdfe57a3bso5418046d6.1
        for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 00:38:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789544310; cv=none;
        d=google.com; s=arc-20260327;
        b=WwQvwqiwUansZfhKPCgiP+urtuDjPRXq79e3VcHHVbdl2FZJB5vUaifUAeUcaRKC6u
         BQq6QwzDximOAGaB7k8uB/PfPC+ic4xSf0k3eN5VNgY0h2vasmShOErGyKsS4NXEuR6G
         myn0qA0TZQFL3P6DCbsYIpgBmMh/P3thE8bx5GYTh4vfUno0ULho1lrgX2JjdFb3mUib
         K23dMqe4q6zOOncDEyobv76faqfn/LNAud8S6m3A2/+3wk0yC2EqOiT2JNvNnoVsrgnL
         cuSeChzls02AzvbW2lp7C5dKnfuVnr3FOMpo9gyCGE0aAyaxu9cfi1hMh6DRzOT5kaBX
         DPFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hQYBSbI5ZDykG/tHrbEEtWawqAnT4ZwcW8GfIYLRIEU=;
        fh=QCFvEOAGZKvricLzVhdMkM311lspggK+leGurs9v6Ks=;
        b=nUoI8irvIyveq7mKy4kkHC8nDjXJEmhRzjQfGrc46BXXZO/FOEk8oaIrXZiJmUEfGS
         EGC/RCRXHOOlOwzZcZm6aVfd+Stxou31G8p8CdT/lQUYaEl7UYd6xwecQzjPyhK6bArp
         Ybuy4qafVC4Dfc5wSli+uLoLLYtL5lZoNKgHyZnPYm4iQ023VUxw+XB45f8/bRSwFx8b
         lcGnx+WhC6FJIjf1qQJkZPofMW33OLXh2kChIyJxPAIsE2L8ikwknSBMUGi77BAR+wKk
         nCzalJRyxQ6iDD2jxhCgEkyG0AUk5/x8IJ5MA9RKn+u2YDgQ6jqqKWM2qsnEksUXv97z
         Q63w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789544310; x=1790149110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hQYBSbI5ZDykG/tHrbEEtWawqAnT4ZwcW8GfIYLRIEU=;
        b=b32oWsj16mxTGEh19RvHUbkJHkIwah2h4TxsF7HLpV77run0DEsVR+XTo1qDJ8oa4T
         Euveeympooh5Xdh/tx8nLhieBUztvkwi59ZmqrtrstKXcuKX/8HePXbWUDJtk92OnJ0t
         RYQo1azCxSMHljt+rD4MxrYz6cmXmi/Bjp3FCAwU9TDBzeVW6U0Mp83DglrETsfFfhIj
         12oLXDWMbFw+aK5Bo76A4EtvXuW/tG46PvDMTssINITG81T4a6/Z3vmpa5g9Ymldbh5X
         uYuSzKKtasN/Rd2D6iNOLKOddvvF8PRXU9zZFFzLa36hHU6vF767LIHV+9f3RHeqFu5X
         An0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544310; x=1790149110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hQYBSbI5ZDykG/tHrbEEtWawqAnT4ZwcW8GfIYLRIEU=;
        b=VwAuhJ3e1/+jv9E8Sz77ShuogJ8pchdPRR2LVz7awfs0RTgb233wAdvibl57qHrOXl
         0PRRE8AxvWVDZiGFH9KpVNKdyxU0sCCNRnyvHk4OWHhkF55msKNnpKqcsBTJtNTsWdzJ
         b2bWhxgLgWvSyLxFjduR/fTJPCkGTMbJx4NaPLfOZ5nzdEdP0CblwP4IuC8HO4WoQaGJ
         dAL3che5jgAhORySjtXuBYzbrXzzqnrFW8MuJtq2kJ2hC6HXKNt5DtcCL/TIpOr9Fyj1
         blweCpeAOF3T85Y+u0PuFRrFqhQ9L7Bkzgg2v616dxtrGfxeESWY1Ms/2YqC9uVeo/0o
         LX3w==
X-Forwarded-Encrypted: i=1; AKwUvBxxwDu/FjGY5EwY6YBO0s4F5ZFpIL3l0jz8N+buPA7UTqx6NxOa0b4CGGF/V0Bb7TEZs9nFCd9ETD8=@vger.kernel.org
X-Gm-Message-State: AFuF++kk8bAZNJ/6caVAB0SROO1KZSQ+OJoPthyXyKda2twWWwtyOnmW
	q4uJyAzNZtxJctYKNOQ5XJDAaFXj0ejeWQy+Cm9ZDtXJ0gsz3r1RegQJIwBHCR+jQ6B/b5D9Wn8
	PJtFJbszfDLq8RLeRZuwyD3FJG01DLYSenWE92E+01w==
X-Gm-Gg: AYBFou3C71meGhXdik+1OLiMwxosLoz57Y//bIHKn0cVqR1VYal2QNquRYFFY58CJg8
	7bX3inODWeWDESfiHJ+33/pqZCmBLvMUJzquXmzyBUuVNwY4ZBERXFe21kQ3gZzJeoj+VPexuUw
	COmRgxlTCrwcTfnWY8Qbv0J2/C+f3Wwu53f9++ZRne7oDFt3A2jrhLtYZP7NDPzHtEWAg5C9FGO
	yxy816jUGyCw48J2mZifBpZZtE41ubqGPPf/YeVAnRbiYBrszRyf9unyHK0f/Kx9+Wk9rBfiXAm
	O618OlLDmYQmWPxDR8Qh1SdYFhjYH0zVg0r8uxrevISi8bJrFr9rXKe3UZWixT5WhSSO5s3Ary7
	Lz7Qm9uf4CaNr
X-Received: by 2002:a05:6214:500c:b0:910:6ffd:a941 with SMTP id
 6a1803df08f44-9123d721985mr29575576d6.5.1789544309746; Wed, 16 Sep 2026
 00:38:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
 <20260907-acpi-dma-v2-3-0ffe4a007992@thegoodpenguin.co.uk> <aqlzjZigicrtyh7o@lizhi-Precision-Tower-5810>
In-Reply-To: <aqlzjZigicrtyh7o@lizhi-Precision-Tower-5810>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 08:38:17 +0100
X-Gm-Features: AcwNN1Vn5ljoRLzFV2GiG-9S0jHlKDZRzXLPscawH2jK-lpFtONtbul3vK317do
Message-ID: <CAA6zWZ+tBBWdsZFGySWFsRKFq-FYy36QAYVQtUOPZ4GVGDYudA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dma: qcom: use named initializers for acpi_device_id
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Please update subject, correct tag is dmaengine
>
> dmaengine: qcom: ....
>
> Frank

I checked the history of all files touched in this series and all
existing commits are tagged with the dmaengine tag=E2=80=94I'll have to
correct all of them. Usually the tag/list name matches the in-tree
directory name, which caused my confusion. Thanks.
