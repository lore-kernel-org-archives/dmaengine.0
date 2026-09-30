Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DD63F327A
	for <dmaengine@vger.kernel.org>; Wed, 30 Sep 2026 07:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752244; cv=pass; b=hEkaabt/HfRve6f2S3QK1rz/VaSvctJersd2/Z3fAXJwPM+/1JoYd3LnE6QFGL6QGwSgtqOZzVxGQ/+/KVxl9bzZeBPeslwa39F8FSkdxPh2tph0O+Qr8MnlsF6nXPi5Phr5WcMQaRXjVgXBPL6GctdmD8gmSMWUqecYXb0vweQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752244; c=relaxed/simple;
	bh=4bW37f5ra0ZUNwTJ/45kz+L36QEIwf8+gHSRR0WSPFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VO6fX2xezqlGhAupwU7NtcgNzPBwEa4YLRGvSgf5W2WTp7eorqqoCRWkDIUd4e9DMxEhW4ujxYIAeOIlbEZq3KzePQJMivMHYYfOoiqebVqIcCdYP5WzkqdLYvMcJFZjBWRSv/kugnru10KSoVCGLJVfFCuH3so1RcO88PSrCeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYO5hL2K; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYO5hL2K"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67583c777abso796764d50.1
        for <dmaengine@vger.kernel.org>; Wed, 30 Sep 2026 00:10:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790752242; cv=none;
        d=google.com; s=arc-20260327;
        b=otKLFR6j2KIfGPQsh7tbD/aG5yeY4eoFPI4xZZFtpElYoGgpYCQlNxfgYdYDMeT6An
         +k/pef6AEEz2Ew1nIYPOZV+hST0ky2cGZi9eKfjeZVSw3cZkaIxZXYUIpeKi/Y36DNOg
         bmZNscxwx247RbQstvSZerHc70/yOrAWGiDtGctX6VN2+MIt9muGnMjAOu0LokmvyjSt
         mkgD1Ft+U/m99k2tPLkLdYeF3qzxKcJt62TFowCKa84VUI06bJ0byyPWcz/YbJCQw4xG
         eWHgq1vW8cmP5NrljDAIcpKeLlZoTt1EAyhJcMK3NR/mPb7xNL7R1Gz2vJ/58pRdlfYp
         LI2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t7jVEGjHXgo7KKiRaoFz99MQ7lhB8VYvddwKFIM2yig=;
        fh=pX8XyJHg9BalEX4uFmDj+eq8glZx80gNUJ0obGAN2DY=;
        b=lRz199jC1GGsu9u5VPT0bARm5qW0khTDQzQrbEuAJXfD4wjOOsbekrh+AXqwteuCjO
         CxTa0UE+l8F7Mz6s9fold/nXHL+o3h7D38v4bHkk63YNQDXkRpTk6YwaVIU9HcejYtfL
         U6yxWBgCRHjKr6F4zOJz9v6LFOpnQSck2Zvd+dRXaWL63STJIhh1NCMDVYCs+KXRs5YI
         VzaskYzoEJRO7/pohAo/v9g/fNYMz56NLcQ6SR7eqGV/aWBZXmA1TjtwsdPJnQUE8DR5
         zcZZSvItwSPP4FybJHcSAaqN8i+GsXnzLxGyzz84NopfqjpD074hJCx7TMrAqEKVbHGk
         /NOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752242; x=1791357042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7jVEGjHXgo7KKiRaoFz99MQ7lhB8VYvddwKFIM2yig=;
        b=EYO5hL2K+mdt0YAFYJhZpbaSHjMGisYXZeo9vah/zTtT+URy8fwbBYCqfCUglzPssE
         G8hL3K8H+THr5OORtpl3WdfY/MGYcHxS00XqB6yCNcPW+uM6gygySDR+bda4fymL5PWB
         Bx3WbWSjQF+sV8EckwYagi1We2FfMVuytlKbhVZ0e71UkmSQhqBRgMzazLFP207MoAeg
         KbxjoBKTRA+f4NM/o1Cq6Zw/ZpIFMf1nxJwDG0zPbwjQ1UIh7CWMiJ3rS40T57Y4IjZU
         XXuif0JavXAC5HGWR43jQdwIgYegEpCpK89gvFlCCDD7iiJg+ZuAhXR+RPil7NpysChU
         sf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752242; x=1791357042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7jVEGjHXgo7KKiRaoFz99MQ7lhB8VYvddwKFIM2yig=;
        b=aHFccRfwYsNIO/rfqnffHXpP5WMS5FuQrxlNQKm2dCiPwy1lizIKFaJkaSCaIDJian
         mApJU5qrbBhSQzaNYBAZzGI0X4yPB08XOXdXUAZ+IHc4xft0OvZRwMLB+YNjOvDbDE5h
         sc1pyv8l4LNutjlqAaApQfTeMZGL1WjpU02UUR2gXTCF6CnAPlLoXM9XvLVOE0WIiBpU
         GIYQpBhMCgOFNtUrrxzqluP3vqG92fDsw+9zQRtOEFMxFSBZfHRRG/0TnDCnUV0AVytI
         tXQ3QBTvZ327FCuKUUikD7GRfVr2esqd7UnAnNfgvkwKUmhil3i6GULJn6knKhAL2APK
         j+QA==
X-Gm-Message-State: AFq9FYJInF+VlkfpzBgicFhuiv9grV/eFkBFaNeN+FP0lckWVh0v7yDP
	RNLOZ1ME8XJQUJVg89YfnClHY2buzYbTCVCW+hqbIgRmC4OH0qg0/ynVd6O26Qkf7J5OvVWt1+Q
	HNeuj0uW5Oi8WmLiJV/TTU1WJ2i4r6Rc=
X-Gm-Gg: AYBFou1tE6hGXd4Jsd3UjbvQNnFYs65YUcTImwigZfPz7pGW8hhmiTTgXCoOW9DhUr1
	S5ce+D3Z7YuC1OgZqeejEir3lBeyx4nWQoaEEBaGpPTpPlR/zjh+kK7xHGI9s3PFJNWcUFPZp5m
	CZ+0hPyH8w4+smrbEiKkhxg1OopXDbL9csDU1+0OzQIt1f3z9qavM7y6EKDEYXfT29kxmNt6rLu
	ARfi1pWk4h0jUPfwCxFddYPHhAtIa0MQkYvUiFhTe0Zpi7Mm4/xD8mnsJHwjJZ6lQLdpw+61Zt1
	sVg/9B4v8ogf0LgGiJz+eENCvCEGGzToc2O7+2KnApc9yJNMHSXUMi6EiUJpfKx9
X-Received: by 2002:a53:d004:0:b0:66f:c1bc:406d with SMTP id
 956f58d0204a3-676835480admr161813d50.53.1790752241587; Wed, 30 Sep 2026
 00:10:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922072233.19592-1-ginger.jzllee@gmail.com>
 <20260929194434.29937-1-ginger.jzllee@gmail.com> <4f327a8d-48aa-42fa-b580-3b01315f65b2@web.de>
In-Reply-To: <4f327a8d-48aa-42fa-b580-3b01315f65b2@web.de>
From: Ginger <ginger.jzllee@gmail.com>
Date: Wed, 30 Sep 2026 09:10:30 +0200
X-Gm-Features: AclHuK-m06GLd90hWdFL-3PJbcsj0LD0PMP9uNnAqCpxpUvgBztAmWsFtzXywOw
Message-ID: <CAGp+u1bger=5W8eNyAME+3JppL2bhYiYYThQY_R3NcrJC+d_CQ@mail.gmail.com>
Subject: Re: [PATCH v2] dmaengine: tegra186-gpc-dma: Read channel state under
 the lock
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, it was detected by a static analyzer that I built. I will update
the patch to reflect that.

Sincerely,
Ginger

On Wed, Sep 30, 2026 at 9:05=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > Read both fields while holding tdc->vc.lock.
> =E2=80=A6
> > ---
> >  drivers/dma/tegra186-gpc-dma.c | 5 +++--=E2=80=A6
>
> Was such a data processing concern detected with the help of any
> source code analysis tools?
>
> Regards,
> Markus
