Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795505057;
	b=IH5qtvrqgVlQVOsKTPA5vdQqAzMq8ahIhfA8L31RSX78vpiO22HTnrxrhJsnh77fQ9z/
	 TnGkKX7dqKLLHyVgA9M3qgABlJXx1oOkzzmd6n5cTxRyGVGUahuL9zQe1LqtWkFI+vfHu
	 uVpW9C8LHoNpxvh3Mdh3Jnck1Apo8f6neP8WwPIZ1cQfKKSn60M5OqKRSOwSC91PSy0Z9
	 L0jvIydXOPPtKC/dlOQTmWgOyCFs+9Q6xpa8vGXpFhIwHeIc2wyxiQS1BzEJrv/z2+YG4
	 I5t19RzIBoXma5JjA4BgFVMAyuHJmxhOeZC4UaZVWxSKZXAJpGOfGqdSGyFy9EbiE6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zQkMMF/iZtl8nyKPPF76wrTKqWng+NcxYhzPMVXCFxw=;
	b=cR62ShIkX5gyaISztIGQ7PlROHI6DBElufa+RhCDJ06LISNyJArIBL2Bvmtnpkm/kGBd
	 u1XjgkrI3xqmLNmaNpXb33VTjXj/YWRTkLKs4mrjT3DgHhgByUhncQX/lkFM/4IDKdnJj
	 ODug2OObfRoazTVHH7Bgds6Pb+I46CjCmVc+6SIptEbkVnEMZnsS9T2Yzv9pjl4RLBBWa
	 LQ7pBmk6XUWbQq2wvEQA5V38WR4fNUCfDIUszwayLVilWEaWKudopo56dMK2D4cqakPE2
	 A0CXlp/nm2zhCXaz0reWSGBSkfml1eJWKxWzuTAO9sVlfp4qqni/TfJS7O+jUGnm7zA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VSYZIOCv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320E3606A321
	for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 07:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 320E3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VSYZIOCv
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be4fea434bso4794528e87.1
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 23:24:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795505055; cv=none;
        d=google.com; s=arc-20260327;
        b=OOeflrsCI0mj8yLBe5SKqNXDJOzLDImwLWyD87/Aa1iXH2Wo47ty4emNUjqindZti7
         wFFyz2Gqdh6ZR5q5t9mSh1S8lMkN9qE5KDOH9hCDG4rgMhSxRUHeq1AzgKVfUIRcjDGy
         baS6zDkmn1Q5k6XM5QdQ8/bFJxM9ymmqzdsuupw2YZkio4r1WEN2MhRCIAhzK/QWooOV
         qRf/6eKW7c9foi6cKurYX+IrPapEsyh2k8V/ouerGXCvMjTlk7lRu6VDlNKWrA1CkJE9
         3psvSj2sYxUM+FcBmF1XHRTCSJIXwz59Z/bovcbmhvi59oq0/sMWHofd233V9i77iYgc
         ZQEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zQkMMF/iZtl8nyKPPF76wrTKqWng+NcxYhzPMVXCFxw=;
        fh=Jr1ykvDNp7UrUXw2nBMyie+6GROXHTg6TZ6StJSEzvM=;
        b=Tq9ZyNGzBP2GaVjV0lUkpOYTlGDUb/6pIzbV45IkJjJ3R+0DWtqNDhvUhk3jUB2Jjz
         Vi9E6xiHEfur8btbRzzKFXqX0QGnDKqhn683HoFeBJfHmDQBodbwNJU7xK0sNSUq+gbP
         O1lGM55ps8HB/U4uOd4Ytdfcpu5vvYjVlmiA65NvAU0mWLk4K+DwIDymMQ8XbsXblEnt
         7L7fCzcchrbAysWlHJzSxlusZL5s6/MrwTD4dE0Yl1E+iZETkBRyuZ4pM86XadE/T4uu
         yV/YoOv305Oq1UudViM1JrksQu3FWfkLrnAO1S0gGu4GPARtFko5JvddugLjsHpV2Bz3
         INFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505055; x=1796109855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zQkMMF/iZtl8nyKPPF76wrTKqWng+NcxYhzPMVXCFxw=;
        b=VSYZIOCvcOvQUj9LYsYZPmOXjBqaNi8d51XoM8nVac28LKKpjkdLS77tVczSFJaKZB
         fW6v97jHKqvUr8LbRep1I7vKYyPWsyU7X/5yzGLyF8hyQd9AFnZWr9No67QR3DG6j4yI
         D9vLoNuTLHHxIMVAFs7UuuuErCf2lDJFLC7qbhJbezfduFywYV95CVzH0phdnjYZSeNW
         kW1JcpnXP6yZK/5cGHw0efH10VszwGCyG9i423p7nsbJFlOzLL3l38e9ufTzGzjxuYUE
         1iU4DG9GQVh/bk+7bPe3r1kigtVLn5oFrYDOK9FvyEeRoJGWvvKLBh7ySc5svpxOqoXr
         73gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505055; x=1796109855;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQkMMF/iZtl8nyKPPF76wrTKqWng+NcxYhzPMVXCFxw=;
        b=n8Wq3xYLP4UsC0G7EL15KvkSCfl8vFA9xRpT8yZnuNH8rFJKqTGeiqJDXvQVg4U1up
         0YChPErSwt/cI0C9l/yA2LaEyNYPtBWlpzrsDnk0hFFmJ3n1UmI5I/XrkkJU1Af94k38
         rioEzwMyTKRRQ4l1YrOQ6y01ux4LqBjmGNeMCF8JsjQKGI32ggbTzPh4Q112KJpaooxY
         IDfKVYZssxI9oFC4N2474ct15FNe51d0PSqvo5G62ma/LgA9cD9e6CuQHLy4u2Mr72Uv
         mGqthHFxNPClDZooGF/yRSDCzpUKfJNHl0Wrw+wXHIsGUMAhtBP/n4qdZklcUrD+B240
         Llbg==
X-Forwarded-Encrypted: i=1; AL+hErHD8g4f0/z93+UyluOUxRQ9njsWe1GVY0uSvBzqPD1ODGpQKV4yhw87Blu1q5+J59cJOo0XFcuYNVQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BvgVIUWO4f2CvUUTd+5RF8yTFFfx/+mZXwOXImQWzoMIIj2kM
	dbSpTHi+pj5ftUbIQ27nE1j4mwk4h3cB5fiqJdjAYN1D7UqwtOKoVbh7GcJUqprvJVy9QpCsp2b
	AcKW4IP/+6QVSz/cfDCikQGtDSIFIEmE=
X-Gm-Gg: AZFdTZf3CjBWFCcAibB7I7vNW44Neh1ANvG6C5FR7T1OvilA2vYJQQJp8mDWyW2u9xt
	QvLILfVFCcZCpSu8UvTTepQ+NxT5WoB/daljpHtjj+Z0Vi1ItMi8nFkhgqmi5+Zlbh11mG55sdL
	nX5UY2Uzh+RmT0AhfKj/wrvrE07EbZbJAWcc6ZnQttLxLYkoMss4X1jrRs6+0SG+0PZGRsI7St+
	manRoaS6VmO+4l+3kpiGr91RDBR40JgqOIUKrgUdhmsjBqcZb9CC0jiS6Bzj+60EWWvPLjWzbNg
	LG4rfHA4DSyP+voZC5si9WQ3MNHcf3ipllhAGLglx3zobPCnQXKT0bszlH4xbFqwoM6XDusu+3O
	+/QIO/HXLEIvZQVYYGXLJxIsKm+vj0khnRMpvZlcWwVmJCGF4/KNWYIe+7qgGDZ6yaFqaW/O0Ed
	QM0j2wDrz4JdIzo1jOV4d5WQ==
X-Received: by 2002:a05:6512:10cd:b0:5c1:a96d:9120 with SMTP id
 2adb3069b0e04-5c1bc89c0d6mr2930509e87.19.1795505055133; Mon, 23 Nov 2026
 23:24:15 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103084638.1190232-1-lixicaicai@gmail.com>
In-Reply-To: <20261103084638.1190232-1-lixicaicai@gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 24 Nov 2026 15:23:38 +0800
X-Gm-Features: Aa3M54ookgLsrqjSC6-F_GMLxVqJAW1i_-P2hir73PZVimwmsAHCWTB2AmYUUTI
Message-ID: <CAJhJPsV+1e6=o+yafDcxet=W=xh0xkPH5GJ7riw=BMyMs1NXnA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dmaengine: loongson1: reject zero-length sg
 requests in prep_slave_sg
To: Li Ximo <lixicaicai@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, linux-mips@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wang Haoran <haoranwangsec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Could you please add a cover letter in the next version to provide an overv=
iew?

On Tue, Nov 3, 2026 at 4:46=E2=80=AFPM Li Ximo <lixicaicai@gmail.com> wrote=
:
>
> From: Wang Haoran <haoranwangsec@gmail.com>
>
> dmaengine_prep_slave_sg() forwards an sg_len of 0 to the driver
> unmodified. ls1x_dma_prep_slave_sg() does not reject it, and
> ls1x_dma_prep_lli() then builds no LLIs (the for_each_sg() loop body
> never executes) yet still returns success, producing a descriptor with
> an empty lli_list that is queued as a valid transfer.
>
> Reject sg_len =3D=3D 0 requests early; a zero-length transfer is meaningl=
ess
> anyway.
>
> This issue was found by static analysis.
>
> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>
> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> ---
> v1: https://lore.kernel.org/r/20261026115113.3359939-1-lixicaicai@gmail.c=
om
> v2: split the two independent fixes into separate patches as requested
> by Frank Li; no code change.
>
>  drivers/dma/loongson/loongson1-apb-dma.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loong=
son/loongson1-apb-dma.c
> index 89786cbd2..e7eb40584 100644
> --- a/drivers/dma/loongson/loongson1-apb-dma.c
> +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> @@ -302,6 +302,9 @@ ls1x_dma_prep_slave_sg(struct dma_chan *dchan, struct=
 scatterlist *sgl,
>         dev_dbg(chan2dev(dchan), "sg_len=3D%u flags=3D0x%lx dir=3D%s\n",
>                 sg_len, flags, dmaengine_get_direction_text(dir));
>
> +       if (!sg_len)
> +               return NULL;
> +
>         desc =3D ls1x_dma_alloc_desc();
>         if (!desc)
>                 return NULL;
> --
> 2.30.2



--=20
Best regards,

Keguang Zhang
