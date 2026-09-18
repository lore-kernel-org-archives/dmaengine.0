Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFE624A067
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755992; cv=pass; b=XxGT4lIwby4R3QqnXFE4FQKGfbKCo78OU32/KsJ7H+gb5qmwRPhSiUmrGAhNASWL0/3Tl9mvvMxN9cQ8EYTjaBvTtfxxbZ8STCDuThEHPhcEu2PM+JSJhvb5f2qB8bESgMWO34EzkdrwXGmroa+xWlW3+rM/NS2TSN4D3i4ZNVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755992; c=relaxed/simple;
	bh=B8dH8j3d8XLDzSCJawbfImR14z+XNYtPHGcF4ZCRVQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aQePXM54yco1a0BcZPXqCkB7sfybjl58Lh0TC4VSxYiL4LYIwIUnvnfxQml2d8YurTZo+hCdfKmW/mEl4+/9itcTDLGniKnlI6+NWLZtWGIfwjvFtz26LFUIorzA55tsEiNUnPLoZZhBP1hSZRzGAoLzbtuPXDOUuamb2QCyVuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5bB8qdS; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5bB8qdS"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1b846so1364079e87.0
        for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 11:26:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789755989; cv=none;
        d=google.com; s=arc-20260327;
        b=IXVE9Ltrl13wgejQ8xKjoyAfVNPYfZC8IUrZJYhif9DgF6AU4aBlJR489mbO2bjydg
         FPTKo14u4Iza9kmP07Fvn7duwHi9mMv2RPX1/mkK/Z1vR/L2BSJP0s3z6tanh1CgR6Mb
         HRbCNmesSInUWwa4jVbWXxCruciJCQ/zB7aIaKsJSaVAoQLX2vRD2cupXV77paQJ7bQY
         GX1TwSAQB5C/bSb84atnl0hnRAYzGrfE2wAGj3K18mckf5nsRSv5Y0E+ZGK74c4XaRrd
         dMzjURN+7WkSIBMXAujCrO5+KoznA0X7ni5X9FIPmWMqcXjf9dvnjEyVsExkOzjzJYDo
         v8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4lxXJUnL2aGCDPT+0B0LiFdakuJvQky3WO+D+mrk96o=;
        fh=Sl9ukgvnsUiOa3NuutfL4Usklue1QaNvUxc80v3X23A=;
        b=WCtQAOjJjk2R4cvE+lgQyUXf76ETcVwsS1gILJjVnOW4wjIkGGCDl8BTKH83CRHIdo
         2uA5gKSWeGEe8aXdh7pWLJvCxLISgNipGfJtNL1qv50k2eSIkg6DrB150ixPthjvuGlj
         HcD48YPdLOmwCA+hoxCf1qU45BjZXrB05p75W7uFriLj6qRb3qn1pnAw+qYGt37R6ESy
         7fuEadhZXJdvFypyIod0k4GuAKWX2Dn0TB5i//Gs7kSVV0jy5CV8v4rrjaV7w+TyhuFb
         boVhRmwWiWQNuCPB7LvDq0B8ANo7xsYc+lTmpojbHQ5JQ+qZQvt9/J7mFzmBXuii19+q
         n9cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789755989; x=1790360789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4lxXJUnL2aGCDPT+0B0LiFdakuJvQky3WO+D+mrk96o=;
        b=C5bB8qdSCvPzFCCYnAxSUC7xE8QAB+dpJzRcEDugLAmjjiEnALKyAVWc5X3VkaY103
         59o5zUTwTs8vZ2ytx7wy3p0b/uuierYyl7hK4K6/ox+Bh/cIDfdf1Id6TkkcB1s3XwFL
         TKfgzbW4PEONiity0YVw55AJxsm3VrkxVfxGwGBeRtZy3gy7PSa1Gp2WYRegYmQ1hPrL
         fkLT9/KnlwdNwWdlrDoqBQvBDUnSunT8+F7IUY6LzNEl04sZqXCZcQ9UxBhnXJ9JlHOn
         juljdj5Yei2Nn/N3KUHtukAij3//tUZZpicumK5JzMxBzenUNSZkNUshFfGplLZukVhV
         Z1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755989; x=1790360789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lxXJUnL2aGCDPT+0B0LiFdakuJvQky3WO+D+mrk96o=;
        b=ec8JR32l8itFulki5qfLQAvAgunkxeiQbMf1R1kB+oGAjL0iSSbN3ibSmPwX9uNrWk
         CTfA5Ht0YN0OwScciqWUdt6SAWwsYcL2X4D6JnVpvUSqULU1QJ0vgJgvTLi8tLhlqvVd
         D8ZOoQ1DZRyk0D/iJ/dG2jR8MQ+smEJPmgbrMyuzKEhDM8AMVb1IGF0r92RrL4JJqJ8V
         R9N8Xh2YWWmEw9afwmREyQb64hvWTPsuAA9VyP4dsSDahv4wzF3ck/OBfHee2ud7WyAm
         1ttX2anK/6eBeUqP86R10NnqGZPsnAsbrBNJFZ2sX7r2Vp1qU5zebcP5P0rhZfKVTwB3
         +CcA==
X-Forwarded-Encrypted: i=1; AKwUvBzs5qTPUNko1M0k7BSaLGuKMMYjrYGc75mMxBbGQgV7DPP3SiX6uzO3CqEQMxaqnhWgKqFPqgZvDM0=@vger.kernel.org
X-Gm-Message-State: AFuF++lkOWUeykyouq7wgonRws1uOIRnHQb194x4Urzct0bIGMYsWEkF
	O4XuubxAh2E6j2nevwDN4kZffxO+1fmiDciYO8FX2Bp2nFrXwrmZ6JmnKJyqM/PsiEpOuCmlmEE
	JhvVEt+QVI9Lg6v1hox+qoeNC8E9XqLWI+Jjl
X-Gm-Gg: AYBFou0n0DSGSg5OgRcUSPZaUvcAHQkAj4zGZqidkkgyBMHIShJ0OhHDkfa+yEAjJaM
	DVUf7ubu+fDMQB0ZukOefosl7yazTpOAhxycBgWNkyhNlq+LhjLTT9gxpZ9zV4qKm9prowmCf7w
	mtk+BtwKTR+wfcZXqWuuym+COuexlWRA9KQvh6WUwCIrb8nOMR5rrSzhc5qmpcv1Jbq2iyNd3h/
	2yx/+Ep6W1ZwiZ2EPjpu/5Gyrbev19blrfkvt1bVhw0XbHVcqpi+7ugT4C+n5w4QeXcgJa95cFz
	2RFqs2DajFzpJDjk0p7JQPiqU+cJ49T/woyKYdnYJTfBQqsQc4yfkRmhufVccWyxO75TLC/rKOf
	YSsDCzhEvTv5HyiI4LRyBk0SZsFFQbfAKswMOzH/deRTYu4vVGxQd5HbE1tAztrlPStk3Obcfmp
	FMDha1qcQ0f6KTJOs59xAbDuDVhmyc//HcDYNeiIgHMr9+cx5mY/NCjmoy/zqmAbfsEQ==
X-Received: by 2002:a17:906:c113:b0:c29:65ef:b907 with SMTP id
 a640c23a62f3a-c2a157c9032mr318214066b.26.1789755554588; Fri, 18 Sep 2026
 11:19:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918175950.21657-1-rosenp@gmail.com> <20260918181025.DCFD81F000FF@smtp.kernel.org>
In-Reply-To: <20260918181025.DCFD81F000FF@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 18 Sep 2026 11:19:02 -0700
X-Gm-Features: AcwNN1Vsq01WUhvaVInIWSguLOn0V0MH48-XC3VKFbzajnMGmMZfA5TB6E39QAM
Message-ID: <CAKxU2N-t9vWTazxtC+dSd-SoV5cvS2Hf98t2J2WrWCZNNjH0tA@mail.gmail.com>
Subject: Re: [PATCHv2] dmaengine: bestcomm: Enable compile testing
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 11:10=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] kconfig: missing PPC_MPC52xx dependency for SND_SOC_MPC5200_AC97
This was merged:

https://lore.kernel.org/linux-sound/178967135736.285745.8925263446043052641=
.b4-ty@b4/
> --
>
> commit 95cb68468081de8e2880323cb63c64d9da8626b0
> Author: Rosen Penev <rosenp@gmail.com>
>
> dmaengine: bestcomm: Enable compile testing
>
> This commit relaxing the dependency for the BestComm DMA engine allows it=
 to
> be selected on PowerPC for compile-test builds. It adds an alternative
> dependency on (PPC && COMPILE_TEST).
>
> > diff --git a/drivers/dma/bestcomm/Kconfig b/drivers/dma/bestcomm/Kconfi=
g
> > index 5dd437295964d..e23ba4982d7ed 100644
> > --- a/drivers/dma/bestcomm/Kconfig
> > +++ b/drivers/dma/bestcomm/Kconfig
> > @@ -5,7 +5,7 @@
> >
> >  config PPC_BESTCOMM
> >       tristate "Bestcomm DMA engine support"
> > -     depends on PPC_MPC52xx
> > +     depends on PPC_MPC52xx || (PPC && COMPILE_TEST)
>
> [Severity: Low]
> Does relaxing this dependency cause an unresolved symbol during link time=
 for
> SND_SOC_MPC5200_AC97?
>
> When COMPILE_TEST is enabled on PowerPC, PPC_BESTCOMM can be selected wit=
hout
> PPC_MPC52xx. However, SND_SOC_MPC5200_AC97 in sound/soc/fsl/Kconfig depen=
ds
> on PPC_BESTCOMM but lacks an explicit dependency on PPC_MPC52xx:
>
> sound/soc/fsl/Kconfig:
>     config SND_SOC_MPC5200_AC97
>         tristate "Freescale MPC5200 PSC in AC97 mode driver"
>         depends on PPC_BESTCOMM
>
> This inherits PPC_BESTCOMM's relaxation and allows the driver to be built
> when the platform code is absent. In psc_ac97_cold_reset(), the driver
> unconditionally calls a platform function:
>
> sound/soc/fsl/mpc5200_psc_ac97.c:psc_ac97_cold_reset() {
>     ...
>         mpc5200_psc_ac97_gpio_reset(psc_dma->id);
>     ...
> }
>
> Since mpc5200_psc_ac97_gpio_reset() is only compiled when PPC_MPC52xx is
> enabled, does this result in an undefined reference at link time?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918175950.21=
657-1-rosenp@gmail.com?part=3D1
