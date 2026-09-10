Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F43859575F
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 19:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789068723; cv=pass; b=kCJLH5izX0cULs2+zDVqL5Z3qUXsRwFzbtHSXWtrCFkhbCk2Np/2cLWBLo0CXoZg66N84ubi9Xq1O6Js5cUzsj+QWUUXel520HFfsf+K1QxfotJyi+mHud7dVwv7alRpxGa1jpY7+RpLAqXCPpRM1kBukwerCwrVAPv22AmPS+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789068723; c=relaxed/simple;
	bh=BCOD+UDwEu/EcPHRC55YdZVtEVa30m3T52Lv8r6g084=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhdYM7C+Yj1lJWk8Y6ijdQdUpouoMAG25boMX0PQWzUGr51trkDPcJJw6JksxXt4aMcCTnQpoLjEgcFqjlF0OorxRQjjVhjj8r4gUq6G2K6nXZFsq76qxYcjhXTiQYSdK/SyvBiTKdAnepibXYsTuke8DhEl1vbB1BL55vtp7TA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PB0mHArs; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PB0mHArs"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c29667ed561so4293166b.2
        for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 12:31:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789068708; cv=none;
        d=google.com; s=arc-20260327;
        b=GyUBHUYIirre5dp9k9xQaB1LqJf/iG/CHTPnRkrDEM/ojuRVyXviOHBPiDsOX0EBUB
         W9uIox2lUuz/LzgeeQ/cMbcQqEiUVP8nVNpXMjOWDwhlQ3Dvz7wiq5vmFuvqRhmL1zyW
         yq9fBvt/X5FJhy9VCz+21V1Tw43spYEpzqoZE2sGNZ65qFv/JRWxHjx5kB0A/zt+juk5
         DBD9e0gC6CYY6AlNT7qSHEBfhX+ntO0/oAtPOHACFSgApRV9okkC7ycX+uzTbLDexO7b
         p+rhD7Dxa6cDBwlOrOTF4SShgc4kIY18C22xJVnXDBXZYQWekPjoM45XF7Eu0Olog5SL
         cnqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rUpE4/08QQtcu5rn/e3HjQ4bcrKGxxgjRXtpMtuV3So=;
        fh=sJwXN6PSTohsAa4UDHf0pgOsg7MYq1JruJC0VmeUVoo=;
        b=Yz5VwzBgcjIFjMywKJHy9RuqEcfB7ITNi7lLlNaUoG590LmD2oVHVQvte/UD8Wci9p
         zCKA8PvDhphx2wn9NuU3eNdsT7MsVr7PazLOowfUmBAINFbgfssy+tXGGFQHHl3tIJiQ
         kxHByBAEuyuBufQBjAo/htk7+MuOxuCnpp0vWNUFD0aDI5plO4GhUWTL3pa33Ki3R/kQ
         ptyORPzZEqZnC3oPH/nN4BSXgcQ6bEy1qb/dahnOPQiqMiLwXI9ciIor9maiCMIz1ZF1
         Bj6ep/wR/aJkZP/LZVEkg0V/8xnu6wVlUN5ShcsSDcdUC9jzFBBSd5DGjR6W1HzkylT7
         n+Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789068708; x=1789673508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUpE4/08QQtcu5rn/e3HjQ4bcrKGxxgjRXtpMtuV3So=;
        b=PB0mHArsRH34V11B0DZUd25e8Wo7c02anj9VYaYy02s44WxqGZREV7C/qD2fkeVoWd
         KueBTjcnbTuodMCo8kkldRT3CKPylQhE617rzRiSiUHyoTGTf/vlXk5lhfAVh/DVvc7/
         tbAOFnP1W8mb/KlR82eAU2HjI0UlD48nEq2v7W0QmWxdEAi5LtbOMKd0dQq995jn+rFZ
         iOpktpuoA/9YRQTONP5MhEXmCsaJu9ZqeuEuwOdItE+J/H0N4/zBXg6nAPHGewmvK37c
         6r7y6usGEhXusRjFmIbXJWhmSHBBqhUOQOAKoTXQ5srXkb0yzOZ/l2CyG3qwQ7LWHuy6
         OSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789068708; x=1789673508;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUpE4/08QQtcu5rn/e3HjQ4bcrKGxxgjRXtpMtuV3So=;
        b=cedYU/nQE1I20fF3jJhF90NUGsHKIdwQwOkCIZ4DgzH8kh1O878UQdjQ9fzhRuZCWB
         aT/LM5lO438a1mkn3et8fkCyjyaFfYM4lWFsdc/KfehODDrOqKoLNijGSX/5JR0IjSfC
         jtDRZgj77w9CfFvDRi6TpOcLK+YhDbH5lZY1P1z8qg3zcyF324EHo2F9pedTvtz/5M7U
         f8hUA+y8RoNQy3gWNzAIIozQbllSWY+GCAw1QtlIPFxoLtQF6odmmsEboeQxwaxsKipK
         ddm+VLTtNBolRkWEr4i4m3EUSK9MdSTJ5IxUDvkhcypRo0N9JM1fu4RNDGSYUd8BOsCn
         dtPg==
X-Gm-Message-State: AFuF++n1Z9lV/J7emXWO/U/zJ/bV9weyNda707j7QQ1n7tLI8+OT/iwx
	OZNovnj8Ubi6tbwF9m8qhzYPSStv4GDeXzJiyucyx7OceQ34EmLqwFAXJwArJdvb+yVvCKnVlkq
	VyB3/WrnhqsF6NsSwVeo7L4H8a/8uFf0=
X-Gm-Gg: AYBFou0CXPJP1zih+3KMlQLjoMsnxReLaAyai//0HNtps6/NHu7g2L/OaNsWtx8boQN
	1YfBOFQw82z+R9iL3R+AyCqqxB+Q3aftxB8cx6VXOxghH7ghJWxuxR/Yj4MlmpVnMtpkUrYWui5
	Qh2IbbMReKXhu6vSti3KthlE6HCZSEyirzrUzLn2rzYBfO3ZxYEgKX0gfNg1ssS5h85JZfWHO3i
	aUJcJh31x+9is2niwvEkNqq+2DgRJyLwS5OVO2sGUXdDqLLj8zleykdTXb0W/t64x2BryM2LaF6
	HSMJYuPxxii7dOLhItl7u5jajlYkdox/fbCdERB8HbOamOaXie6FWwqfikSLU9JJ0xh65Y1mWxH
	S4KW0o/Z4C1t3v3dpnSqv2OLbo5KLQR5lI72jiCoCnq7WfkqhRvWbOSzY8RxCaC66H9ExjV1A+v
	cLK3WK3KD2CA5sx+aweLeSdChgwSZFQgoBvZoC1xgGs/YDVQHzT1Gs/ymbO9JnK3B6ug==
X-Received: by 2002:a17:907:6e8e:b0:c29:57c4:cb92 with SMTP id
 a640c23a62f3a-c29661bfe7dmr10767666b.0.1789068708317; Thu, 10 Sep 2026
 12:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820002816.17382-1-rosenp@gmail.com> <aqK0A4TFCM-laOab@parshuram>
In-Reply-To: <aqK0A4TFCM-laOab@parshuram>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 10 Sep 2026 12:31:36 -0700
X-Gm-Features: AcwNN1Uq4fZ-T-KVq39eU8J9hv5nIL5nrMVLIWG1qvJ4Nk2oF1d61Ro6RMGK7r4
Message-ID: <CAKxU2N_x1cJ2Am1UyBK--Jj+AP85jfkUv7J1_LHLEnmOpgajPQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: fsl_raid: fix sparse warnings
To: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 6:43=E2=80=AFAM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> On 19-08-26, 17:28, Rosen Penev wrote:
> > The register maps in fsl_raid.h annotate every field as __be32, but
> > they are accessed only through ioread32be()/iowrite32be(), which
> > already perform the byte swap and take plain u32 __iomem pointers.
> > The __be32 annotation therefore makes sparse reject each access:
> >
> >   drivers/dma/fsl_raid.c:116:17: sparse: incorrect type in argument 1
> >       (different base types) ... got restricted __be32 [noderef] __iome=
m *
> >
> > Drop __be32 from struct fsl_re_ctrl and struct fsl_re_chan_cfg; the
> > descriptor/CDB structures written via cpu_to_be32() keep their
> > annotations.
> >
> > Also fix the remaining sparse warnings in fsl_raid.c:
> >
> >   - compare the desc pointer with !desc instead of desc <=3D 0 in the
> >     three prep functions,
> >   - byte swap cdb32 with cpu_to_be32() when programming the XOR, PQ
> >     and MOVE command descriptor blocks; the plain u32 assignment is
> >     broken on little-endian hosts.
>
> Can you split the change per warning type? Also, the subject should
> describe the change and fix something.
Would it make sense to do that for a single report though?
>
>
> >
> > No warnings remain.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202608200637.ro1CqMxi-lkp=
@intel.com/
> > Fixes: 68b7fbc23529 ("dma: fsl_raid: keep MMIO bases as void __iomem an=
d cast at access")
> > Assisted-by: opencode:deepseek-v4-flash-free
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/dma/fsl_raid.c | 12 +++++-----
> >  drivers/dma/fsl_raid.h | 54 +++++++++++++++++++++---------------------
> >  2 files changed, 33 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> > index a35ddc1297ce..524a7329c3c4 100644
> > --- a/drivers/dma/fsl_raid.c
> > +++ b/drivers/dma/fsl_raid.c
> > @@ -350,7 +350,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_=
dma_genq(
> >       }
> >
> >       desc =3D fsl_re_chan_alloc_desc(re_chan, flags);
> > -     if (desc <=3D 0)
> > +     if (!desc)
> >               return NULL;
> >
> >       if (scf && (flags & DMA_PREP_CONTINUE)) {
> > @@ -365,7 +365,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_=
dma_genq(
> >       cdb |=3D FSL_RE_INTR_ON_ERROR << FSL_RE_CDB_ERROR_SHIFT;
> >       cdb |=3D FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
> >       xor =3D desc->cdb_addr;
> > -     xor->cdb32 =3D cdb;
> > +     xor->cdb32 =3D cpu_to_be32(cdb);
> >
> >       if (scf) {
> >               /* compute q =3D src0*coef0^src1*coef1^..., * is GF(8) mu=
lt */
> > @@ -474,7 +474,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_=
dma_pq(
> >               src_cnt +=3D 3;
> >
> >       desc =3D fsl_re_chan_alloc_desc(re_chan, flags);
> > -     if (desc <=3D 0)
> > +     if (!desc)
> >               return NULL;
> >
> >       /* Filling GenQQ CDB */
> > @@ -485,7 +485,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_=
dma_pq(
> >       cdb |=3D FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
> >
> >       pq =3D desc->cdb_addr;
> > -     pq->cdb32 =3D cdb;
> > +     pq->cdb32 =3D cpu_to_be32(cdb);
> >
> >       p =3D pq->gfm_q1;
> >       /* Init gfm_q1[] */
> > @@ -558,7 +558,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_=
dma_memcpy(
> >       }
> >
> >       desc =3D fsl_re_chan_alloc_desc(re_chan, flags);
> > -     if (desc <=3D 0)
> > +     if (!desc)
> >               return NULL;
> >
> >       /* Filling move CDB */
> > @@ -568,7 +568,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_=
dma_memcpy(
> >       cdb |=3D FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
> >
> >       move =3D desc->cdb_addr;
> > -     move->cdb32 =3D cdb;
> > +     move->cdb32 =3D cpu_to_be32(cdb);
> >
> >       /* Filling frame 0 of CFD with move CDB */
> >       cf =3D desc->cf_addr;
> > diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
> > index 748047996bbc..1b6f6b82c7d3 100644
> > --- a/drivers/dma/fsl_raid.h
> > +++ b/drivers/dma/fsl_raid.h
> > @@ -109,59 +109,59 @@
> >
> >  struct fsl_re_ctrl {
> >       /* General Configuration Registers */
> > -     __be32 global_config;   /* Global Configuration Register */
> > +     u32 global_config;      /* Global Configuration Register */
> >       u8     rsvd1[4];
> > -     __be32 galois_field_config; /* Galois Field Configuration Registe=
r */
> > +     u32 galois_field_config; /* Galois Field Configuration Register *=
/
> >       u8     rsvd2[4];
> > -     __be32 jq_wrr_config;   /* WRR Configuration register */
> > +     u32 jq_wrr_config;      /* WRR Configuration register */
> >       u8     rsvd3[4];
> > -     __be32 crc_config;      /* CRC Configuration register */
> > +     u32 crc_config;         /* CRC Configuration register */
> >       u8     rsvd4[228];
> > -     __be32 system_reset;    /* System Reset Register */
> > +     u32 system_reset;       /* System Reset Register */
> >       u8     rsvd5[252];
> > -     __be32 global_status;   /* Global Status Register */
> > +     u32 global_status;      /* Global Status Register */
> >       u8     rsvd6[832];
> > -     __be32 re_liodn_base;   /* LIODN Base Register */
> > +     u32 re_liodn_base;      /* LIODN Base Register */
> >       u8     rsvd7[1712];
> > -     __be32 re_version_id;   /* Version ID register of RE */
> > -     __be32 re_version_id_2; /* Version ID 2 register of RE */
> > +     u32 re_version_id;      /* Version ID register of RE */
> > +     u32 re_version_id_2;    /* Version ID 2 register of RE */
> >       u8     rsvd8[512];
> > -     __be32 host_config;     /* Host I/F Configuration Register */
> > +     u32 host_config;        /* Host I/F Configuration Register */
> >  };
> >
> >  struct fsl_re_chan_cfg {
> >       /* Registers for JR interface */
> > -     __be32 jr_config_0;     /* Job Queue Configuration 0 Register */
> > -     __be32 jr_config_1;     /* Job Queue Configuration 1 Register */
> > -     __be32 jr_interrupt_status; /* Job Queue Interrupt Status Registe=
r */
> > +     u32 jr_config_0;        /* Job Queue Configuration 0 Register */
> > +     u32 jr_config_1;        /* Job Queue Configuration 1 Register */
> > +     u32 jr_interrupt_status; /* Job Queue Interrupt Status Register *=
/
> >       u8     rsvd1[4];
> > -     __be32 jr_command;      /* Job Queue Command Register */
> > +     u32 jr_command;         /* Job Queue Command Register */
> >       u8     rsvd2[4];
> > -     __be32 jr_status;       /* Job Queue Status Register */
> > +     u32 jr_status;          /* Job Queue Status Register */
> >       u8     rsvd3[228];
> >
> >       /* Input Ring */
> > -     __be32 inbring_base_h;  /* Inbound Ring Base Address Register - H=
igh */
> > -     __be32 inbring_base_l;  /* Inbound Ring Base Address Register - L=
ow */
> > -     __be32 inbring_size;    /* Inbound Ring Size Register */
> > +     u32 inbring_base_h;     /* Inbound Ring Base Address Register - H=
igh */
> > +     u32 inbring_base_l;     /* Inbound Ring Base Address Register - L=
ow */
> > +     u32 inbring_size;       /* Inbound Ring Size Register */
> >       u8     rsvd4[4];
> > -     __be32 inbring_slot_avail; /* Inbound Ring Slot Available Registe=
r */
> > +     u32 inbring_slot_avail; /* Inbound Ring Slot Available Register *=
/
> >       u8     rsvd5[4];
> > -     __be32 inbring_add_job; /* Inbound Ring Add Job Register */
> > +     u32 inbring_add_job;    /* Inbound Ring Add Job Register */
> >       u8     rsvd6[4];
> > -     __be32 inbring_cnsmr_indx; /* Inbound Ring Consumer Index Registe=
r */
> > +     u32 inbring_cnsmr_indx; /* Inbound Ring Consumer Index Register *=
/
> >       u8     rsvd7[220];
> >
> >       /* Output Ring */
> > -     __be32 oubring_base_h;  /* Outbound Ring Base Address Register - =
High */
> > -     __be32 oubring_base_l;  /* Outbound Ring Base Address Register - =
Low */
> > -     __be32 oubring_size;    /* Outbound Ring Size Register */
> > +     u32 oubring_base_h;     /* Outbound Ring Base Address Register - =
High */
> > +     u32 oubring_base_l;     /* Outbound Ring Base Address Register - =
Low */
> > +     u32 oubring_size;       /* Outbound Ring Size Register */
> >       u8     rsvd8[4];
> > -     __be32 oubring_job_rmvd; /* Outbound Ring Job Removed Register */
> > +     u32 oubring_job_rmvd;   /* Outbound Ring Job Removed Register */
> >       u8     rsvd9[4];
> > -     __be32 oubring_slot_full; /* Outbound Ring Slot Full Register */
> > +     u32 oubring_slot_full;  /* Outbound Ring Slot Full Register */
> >       u8     rsvd10[4];
> > -     __be32 oubring_prdcr_indx; /* Outbound Ring Producer Index */
> > +     u32 oubring_prdcr_indx; /* Outbound Ring Producer Index */
> >  };
> >
> >  /*
> > --
> > 2.55.0
> >
>
> --
> ~Vinod
